class DepartmentQuestionnaire < ApplicationRecord
  include Discard::Model
  include QuestionnaireStates
  include StudyIterationScoped

  belongs_to :department
  belongs_to :study_iteration

  has_many :patients, through: :department
  has_one :country, through: :department

  questionnaire_state :state
  enum hospital_type: [:university, :teaching, :district, :other]

  before_update :set_state

  private
  def set_state
    self.state = errors.any? ? :invalid : :valid
  end
end
