class Department < ApplicationRecord
  include AdminResource

  belongs_to :hospital
  has_one :department_questionnaire
  has_many :employees
  has_many :patients
  has_many :users, through: :employees
  validates :name, presence: true, uniqueness: { scope: :hospital_id }

  viewable_admin_table_fields :name, :hospital
  editable_admin_fields :name, :hospital

  after_create :create_department_questionnaire

  def to_s
    name
  end

  private
  def create_department_questionnaire
    self.create_department_questionnaire
  end
end
