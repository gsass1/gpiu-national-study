class User < ApplicationRecord
  include Discard::Model
  include Bitmask
  rolify

  TITLES = %w[Mr. Ms. Dr. Prof.].freeze

  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  if Keycloak::enabled?
    if Gpiu::allow_local_accounts?
      devise :database_authenticatable, :registerable,
        :rememberable, :trackable, :validatable,
        :recoverable,
        :omniauthable, :omniauth_providers => [:keycloakopenid]
    else
      devise :database_authenticatable, :registerable,
        :rememberable, :trackable, :validatable,
        :omniauthable, :omniauth_providers => [:keycloakopenid]
    end
  else
    devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :trackable, :validatable
  end

  has_many :employed, dependent: :destroy, class_name: "Employee"
  has_many :departments, through: :employed
  has_many :hospitals
  has_many :employed_hospitals, through: :departments, source: :hospital
  has_many :notifications, foreign_key: :recipient_id
  has_many :patients, dependent: :destroy, foreign_key: :creator_id
  has_many :support_requests

  validates :first_name, presence: true
  validates :last_name, presence: true


  validates :email, presence: true

  # Do not validate country and title when user JUST registered through keycloak
  attr_accessor :registered_through_keycloak
  belongs_to :country, optional: Proc.new { |f| f.registered_through_keycloak == true }

  with_options unless: :registered_through_keycloak do |group|
    group.validates :country_id, presence: true
    group.validates :title, presence: true, inclusion: { in: TITLES }
  end

  bitmask :notifications_mask, [:email_notifications]

  before_create :set_default_notification_settings

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end

  def to_s
    "#{title} #{first_name} #{last_name} #{suffix}"
  end

  def short_name
    "#{title} #{last_name}"
  end

  # NOTE(gian): helper methods for employment
  def is_employed?
    employed.any?
  end

  def is_employed_in?(department)
    !employement_for(department).nil?
  end

  def employement_for(department)
    employed.where(department_id: department.id).first
  end

  def admin?
    has_role? :admin
  end

  def unread_notifications_count
    unread_notifications.count
  end

  def unread_notifications
    Notification.where(recipient: self, read_at: nil)
  end

  def valid_patients_count
    patients.includes(:patient_identification).select { |p| p.questionnaires_valid? }.count
  end

  def invalid_patients_count
    patients.count - valid_patients_count
  end

  def self.from_omniauth(auth)
    where(keycloak_uid: auth.uid).first_or_create do |user|
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.registered_through_keycloak = true
    end
  end

  def synchronize_with_keycloak_info(auth)
    self.first_name = auth.info.first_name
    self.last_name = auth.info.last_name
    self.email = auth.info.email
    self.registered_through_keycloak = true
    self.save
  end

  def external?
    !self.keycloak_uid.blank?
  end

  def registration_complete?
    !(self.external? && (self.title.nil? || self.country_id.nil?))
  end

  private
  def set_default_notification_settings
    self.email_notifications = true
  end
end
