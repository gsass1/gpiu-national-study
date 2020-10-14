class Department < ApplicationRecord
  include AdminResource

  belongs_to :hospital
  has_many :department_questionnaires
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

  # TODO: create department_questionnaires when a study iteration is approvd
  def current_department_questionnaire
    study_iteration = self.hospital.country.current_study_iteration
    unless study_iteration.nil?
      @current_department_questionnaire ||= self.department_questionnaires.within_study_iteration(study_iteration).first
    else
      nil
    end
  end

  def create_department_questionnaire
    study_iteration = self.hospital.country.current_study_iteration
    unless study_iteration.nil?
      if current_department_questionnaire.nil?
        self.department_questionnaires.create study_iteration_id: study_iteration.id
      end
    end
  end
end
