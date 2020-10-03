module QuestionnaireStates
  extend ActiveSupport::Concern

  class_methods do
    def questionnaire_state(name)
      enum name => [:missing, :valid, :invalid, :waiting, :locked, :field_error, :info, :open], _prefix: name
    end
  end
end
