# frozen_string_literal: true

module Questionnaire
  extend ActiveSupport::Concern

  class_methods do
    attr_writer :custom_questionnaire_state_name

    def custom_questionnaire_state(name)
      @custom_questionnaire_state_name = name
    end
  end

  included do
    attr_accessor :state

    belongs_to :patient
    validates :patient_id, presence: true, strict: true

    before_update :set_state!, :set_state_in_patient!
  end

  private

  def set_state!
    self.state = if errors.any?
                   :invalid
                 else
                   :valid
                 end
  end

  # Updates the state of this questionnaire in the patient
  def set_state_in_patient!
    name = @custom_questionnaire_state_name || "#{self.class.name.gsub('Patient', '').gsub('Questionnaire',
                                                                                           '').underscore}_state".to_sym
    patient.update_attribute(name, state)
  end
end
