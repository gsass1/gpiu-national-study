class User < ApplicationRecord
  rolify
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
  validates :email, presence: true

  def is_employed?
    employed.any?
  end

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end
end
