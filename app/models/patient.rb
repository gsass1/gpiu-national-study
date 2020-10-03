class Patient < ApplicationRecord
  include Discard::Model
  include QuestionnaireStates

  belongs_to :department
  belongs_to :creator, class_name: 'User'
  belongs_to :study_iteration

  enum patient_type: [:uti_ssi, :prostate_biopsy]

  has_one :patient_identification, inverse_of: :patient, dependent: :destroy
  questionnaire_state :identification_state

  questionnaire_state :uti_state
  questionnaire_state :ssi_state
  questionnaire_state :prostate_biopsy_state
  questionnaire_state :prostate_biopsy_outcome_state

  validates :department_id, presence: true
  validates :study_iteration_id, presence: true
  validates :patient_type, presence: true

  scope :uti_ssi, -> { where(patient_type: :uti_ssi) }
  scope :prostate_biopsy, -> { where(patient_type: :prostate_biopsy) }

  def self.within_study_iteration(study_iteration)
    unless study_iteration.nil?
      self.where(study_iteration_id: study_iteration.id)
    else
      []
    end
  end

  after_create :create_questionnaires

  private
  def create_questionnaires
    self.create_patient_identification
  end
end
