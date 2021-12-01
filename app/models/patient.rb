# frozen_string_literal: true

class Patient < ApplicationRecord
  include Discard::Model
  include CsvCollection
  include QuestionnaireStates
  include StudyIterationScoped

  belongs_to :department
  belongs_to :creator, class_name: 'User'
  belongs_to :study_iteration

  enum patient_type: { uti_ssi: 0, prostate_biopsy: 1 }

  has_one :patient_identification, inverse_of: :patient, dependent: :destroy
  has_one :uti_questionnaire, inverse_of: :patient, dependent: :destroy
  has_one :ssi_questionnaire, inverse_of: :patient, dependent: :destroy
  has_one :biopsy_questionnaire, inverse_of: :patient, dependent: :destroy
  has_one :biopsy_outcome_questionnaire, inverse_of: :patient, dependent: :destroy

  questionnaire_state :identification_state
  questionnaire_state :uti_state
  questionnaire_state :ssi_state
  questionnaire_state :biopsy_state
  questionnaire_state :biopsy_outcome_state

  def questionnaires_valid?
    if uti_ssi?
      valid = identification_state_valid?
      valid &&= uti_state_valid? if uti_form_needed?
      valid &&= ssi_state_valid? if ssi_form_needed?

      valid
    else
      biopsy_state_valid? && biopsy_outcome_state_valid?
    end
  end

  validates :department_id, presence: true
  validates :study_iteration_id, presence: true
  validates :patient_type, presence: true
  validates :initial, presence: true, allow_blank: false

  scope :uti_ssi, -> { where(patient_type: :uti_ssi) }
  scope :prostate_biopsy, -> { where(patient_type: :prostate_biopsy) }

  after_create :create_questionnaires

  def uti_form_needed?
    return false unless identification_state_valid? && patient_identification.try(&:infection_type)

    uti_ssi? && %i[uti both].include?(patient_identification.infection_type.to_sym)
  end

  def ssi_form_needed?
    return false unless identification_state_valid? && patient_identification.try(&:infection_type)

    uti_ssi? && %i[ssi both].include?(patient_identification.infection_type.to_sym)
  end

  def to_s
    "Patient #{id}-#{initial}-#{study_iteration.name}"
  end

  def create_questionnaires
    create_patient_identification
    create_ssi_questionnaire
    create_uti_questionnaire
    create_biopsy_questionnaire
    create_biopsy_outcome_questionnaire
  end
end
