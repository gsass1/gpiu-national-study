class Patient < ApplicationRecord
  include Discard::Model
  include QuestionnaireStates

  belongs_to :department
  belongs_to :creator, class_name: 'User'
  belongs_to :study_iteration

  enum type: [:uti, :ssi]

  questionnaire_state :identification_state
  questionnaire_state :uti_state
  questionnaire_state :ssi_state
  questionnaire_state :prostate_biopsy_state
  questionnaire_state :prostate_biopsy_outcome_state

  validates :department_id, presence: true
  validates :creator_id, presence: true
  validates :study_iteration_id, presence: true
end
