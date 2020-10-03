module QuestionnaireStates
  extend ActiveSupport::Concern

  class_methods do
    def questionnaire_state(name)
      enum name => [:valid, :invalid, :waiting, :locked, :field_error, :missing, :info, :open]
    end
  end
end
