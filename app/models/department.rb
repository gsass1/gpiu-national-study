class Department < ApplicationRecord
  include CsvCollection

  belongs_to :hospital
  has_many :department_questionnaires
  has_many :employees
  has_many :patients
  has_many :users, through: :employees
  validates :name, presence: true, uniqueness: { scope: :hospital_id }

  scope :visible, -> { includes(:hospital).where(hospitals: { acceptance_state: :approved }) }
  after_create :create_department_questionnaire

  def name_with_hospital
    "#{self.hospital.name} - #{self.name}"
  end

  def to_s
    name_with_hospital
  end

  def current_department_questionnaire
    @current_department_questionnaire ||= load_current_department_questionnaire
  end

  def create_department_questionnaire
    study_iteration = self.hospital.country.current_study_iteration
    unless study_iteration.nil?
      if current_department_questionnaire.nil?
        self.department_questionnaires.create study_iteration_id: study_iteration.id
      end
    end
  end

  def patient_count
    Patient.where(department_id: self.id).count
  end

  private
  def load_current_department_questionnaire
    study_iteration = self.hospital.country.current_study_iteration
    unless study_iteration.nil?
      self.department_questionnaires.within_study_iteration(study_iteration).first
    else
      nil
    end
  end
end
