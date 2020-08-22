class User < ApplicationRecord
  rolify

  TITLES = %w[Mr. Ms. Dr. Prof.].freeze

  after_create :assign_default_role

  include Discard::Model

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :country
  has_many :employed, dependent: :destroy, class_name: "Employee"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :title, presence: true, inclusion: { in: TITLES }
  validates :email, presence: true

  def is_employed?
    employed.any?
  end

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end

  def to_s
    "#{title}. #{first_name} #{last_name} #{suffix}"
  end

  def short_name
    "#{title} #{last_name}"
  end
end
