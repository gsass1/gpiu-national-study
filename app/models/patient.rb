class Patient < ApplicationRecord
  include AdminResource
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

  viewable_admin_table_fields :initial, :creator, :study_iteration, :department, :patient_type, :identification_state, :uti_state, :ssi_state, :prostate_biopsy_state, :prostate_biopsy_outcome_state
  editable_admin_fields :initial, :creator, :study_iteration, :patient_type
  admin_custom_actions :admin_actions

  def admin_actions
    [{
      name: "Open Include Form",
      color: :success,
      route: [:edit_patient_identification_path, self.patient_identification.id],
    }]
  end

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

  def uti_form_needed?
    return false unless self.identification_state_valid?
    self.uti_ssi? && [:uti, :both].include?(self.patient_identification.infection_type.to_sym)
  end

  def ssi_form_needed?
    return false unless self.identification_state_valid?
    self.uti_ssi? && [:ssi, :both].include?(self.patient_identification.infection_type.to_sym)
  end

  def to_s
    "Patient #{self.id}-#{self.initial}-#{self.study_iteration.name}"
  end

  private
  def create_questionnaires
    self.create_patient_identification
  end
end
