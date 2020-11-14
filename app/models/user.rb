class User < ApplicationRecord
  include Bitmask
  rolify

  TITLES = %w[Mr. Ms. Dr. Prof.].freeze

  after_create :assign_default_role

  include Discard::Model
  include AdminResource

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :country
  has_many :employed, dependent: :destroy, class_name: "Employee"
  has_many :departments, through: :employed
  has_many :hospitals, through: :departments
  has_many :notifications, foreign_key: :recipient_id
  has_many :patients, dependent: :destroy, foreign_key: :creator_id
  has_many :support_requests

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :title, presence: true, inclusion: { in: TITLES }
  validates :email, presence: true

  viewable_admin_table_fields :title, :first_name, :last_name, :email, :country
  editable_admin_fields :title, :first_name, :last_name, :email, :country
  viewable_admin_associations :hospitals, :patients, :support_requests

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
    patients.includes(:patient_identification).select { |p| p.valid? }.count
  end

  def invalid_patients_count
    patients.count - valid_patients_count
  end

  private
  def set_default_notification_settings
    self.email_notifications = true
  end
end
