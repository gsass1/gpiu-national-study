module Questionnaire
  extend ActiveSupport::Concern

  included do
    attr_accessor :state
    belongs_to :patient
    validates :patient_id, presence: true, strict: true

    before_update :set_state!, :set_state_in_patient!
  end

  private
  def set_state!
    unless errors.any?
      self.state = :valid
    else
      self.state = :invalid
    end
  end

  # Updates the state of this questionnaire in the patient
  def set_state_in_patient!
    name = "#{self.class.name.gsub('Patient', '').gsub('Questionnaire', '').underscore}_state".to_sym
    self.patient.update_attribute(name, self.state)
  end
end
