# frozen_string_literal: true

module QuestionnaireStates
  extend ActiveSupport::Concern

  def self.validation_order
    %i[missing invalid valid]
  end

  class_methods do
    def questionnaire_state(name)
      enum name => { missing: 0, valid: 1, invalid: 2, waiting: 3, locked: 4, field_error: 5, info: 6, open: 7 },
           _prefix: name
    end
  end
end
