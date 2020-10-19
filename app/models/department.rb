class Department < ApplicationRecord
  include AdminResource
  include CsvCollection

  belongs_to :hospital
  has_many :department_questionnaires
  has_many :employees
  has_many :patients
  has_many :users, through: :employees
  validates :name, presence: true, uniqueness: { scope: :hospital_id }

  viewable_admin_table_fields :name, :hospital
  editable_admin_fields :name, :hospital
  viewable_admin_associations :department_questionnaires
  admin_custom_actions :admin_actions

  def admin_actions
    unless current_department_questionnaire.nil?
      [{
        name: "Open Hospital Questionnaire",
        color: :success,
        route: [:edit_hospital_department_department_questionnaire_path, hospital, self, current_department_questionnaire]
      }]
    end
  end

  after_create :create_department_questionnaire

  def name_with_hospital
    "#{self.hospital.name} - #{self.name}"
  end

  def to_s
    name_with_hospital
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
