# frozen_string_literal: true

class User < ApplicationRecord
  include Discard::Model
  include Bitmask
  rolify

  TITLES = %w[Mr. Ms. Dr. Prof.].freeze

  before_create :set_default_notification_settings
  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  if Keycloak.enabled?
    if Gpiu.allow_local_accounts?
      devise :database_authenticatable, :registerable,
             :rememberable, :trackable, :validatable,
             :recoverable,
             :omniauthable, omniauth_providers: [:keycloakopenid]
    else
      devise :database_authenticatable, :registerable,
             :rememberable, :trackable, :validatable,
             :omniauthable, omniauth_providers: [:keycloakopenid]
    end
  else
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
  end

  has_many :employed, dependent: :destroy, class_name: 'Employee'
  has_many :departments, through: :employed
  has_many :hospitals, dependent: :destroy
  has_many :employed_hospitals, through: :departments, source: :hospital
  has_many :notifications, foreign_key: :recipient_id, dependent: :destroy, inverse_of: :recipient
  has_many :patients, dependent: :destroy, foreign_key: :creator_id, inverse_of: :creator
  has_many :support_requests, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true

  # Do not validate country and title when user JUST registered through keycloak
  attr_accessor :registered_through_keycloak

  belongs_to :country, optional: proc { |f| f.registered_through_keycloak == true }

  with_options unless: :registered_through_keycloak do
    validates :country_id, presence: true
    validates :title, presence: true, inclusion: { in: TITLES }
  end

  bitmask :notifications_mask, [:email_notifications]

  def assign_default_role
    add_role(:user) if roles.blank?
  end

  def to_s
    "#{title} #{first_name} #{last_name} #{suffix}"
  end

  def short_name
    "#{title} #{last_name}"
  end

  # NOTE(gian): helper methods for employment
  def employed?
    employed.any?
  end

  def employed_in?(department)
    !employement_for(department).nil?
  end

  def employement_for(department)
    employed.where(department_id: department.id).first
  end

  def admin?
    has_role? :admin
  end

  delegate :count, to: :unread_notifications, prefix: true

  def unread_notifications
    Notification.where(recipient: self, read_at: nil)
  end

  def valid_patients_count
    patients.includes(:patient_identification).select(&:questionnaires_valid?).count
  end

  def invalid_patients_count
    patients.count - valid_patients_count
  end

  def self.from_omniauth(auth)
    where(keycloak_uid: auth.uid).first_or_create do |user|
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.registered_through_keycloak = true
    end
  end

  def synchronize_with_keycloak_info(auth)
    self.first_name = auth.info.first_name
    self.last_name = auth.info.last_name
    self.email = auth.info.email
    self.registered_through_keycloak = true
    save
  end

  def external?
    keycloak_uid.present?
  end

  def registration_complete?
    !(external? && (title.nil? || country_id.nil?))
  end

  private

  def set_default_notification_settings
    self.email_notifications = true
  end
end
