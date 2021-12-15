# frozen_string_literal: true

class Department < ApplicationRecord
  include CsvCollection

  belongs_to :hospital
  has_many :department_questionnaires, dependent: :destroy
  has_many :employees, dependent: :destroy
  has_many :patients, dependent: :destroy
  has_many :users, through: :employees
  validates :name, presence: true, uniqueness: { scope: :hospital_id }

  scope :visible, -> { includes(:hospital).where(hospitals: { acceptance_state: :accepted }) }
  after_create :create_department_questionnaire

  delegate :country, to: :hospital

  def name_with_hospital
    "#{hospital.name} - #{name}"
  end

  def to_s
    name_with_hospital
  end

  def current_department_questionnaire
    @current_department_questionnaire ||= load_current_department_questionnaire
  end

  def create_department_questionnaire
    study_iteration = country.current_study_iteration
    return unless !study_iteration.nil? && current_department_questionnaire.nil?

    department_questionnaires.create study_iteration_id: study_iteration.id
  end

  def patient_count
    Patient.where(department_id: id).count
  end

  private

  def load_current_department_questionnaire
    study_iteration = country.current_study_iteration
    department_questionnaires.within_study_iteration(study_iteration).first unless study_iteration.nil?
  end
end
