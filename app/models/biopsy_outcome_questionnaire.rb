# frozen_string_literal: true

class BiopsyOutcomeQuestionnaire < ApplicationRecord
  include CultureResult
  include Discard::Model
  include Exportable
  include Questionnaire
  include SaveWithErrors
  include YesNoUnknown

  belongs_to :patient

  include BiopsyOutcomeQuestionnaires::Sanitization
  include BiopsyOutcomeQuestionnaires::Validation
  include BiopsyOutcomeQuestionnaires::ExportFormat

  enum histopathology_biopsy_material_change_severity: { mild: 0, moderate: 1, severe: 2 }, _prefix: true
end
