class Hospital < ApplicationRecord
  include Discard::Model

  belongs_to :address, dependent: :destroy
  belongs_to :country
  accepts_nested_attributes_for :address

  has_many :departments

  validates :name, presence: true

  default_scope { order(name: :desc) }

  # NOTE(gian): this gets assigned by the 'new hospital' form. This is a bit
  # more elegant than having the controller do everything
  attr_accessor :first_department_name
  after_create :create_first_department
  validates :first_department_name, presence: true, on: :create

  def self.admin_table_fields
    [:name, :address, :country]
  end

  def self.admin_form_fields
    [:name, :address, :country]
  end

  def to_s
    name
  end

  private

  def create_first_department
    departments.create name: first_department_name
  end
end
