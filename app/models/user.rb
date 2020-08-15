class User < ApplicationRecord
  rolify
  include Discard::Model

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :country
  has_many :employed, dependent: :destroy, class_name: "Employee"

  validates :first_name, presence: true
  validates :last_name, presence: true

  def is_employed?
    employed.any?
  end
end
