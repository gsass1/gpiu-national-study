# frozen_string_literal: true

class BiopsyQuestionnaire < ApplicationRecord
  include CultureResult
  include Discard::Model
  include Exportable
  include Questionnaire
  include SaveWithErrors
  include YesNoUnknown

  NUM_CORES_OPTIONS = (1..23).to_a.map(&:to_s).reverse.unshift('>=24').freeze

  include BiopsyQuestionnaires::Sanitization
  include BiopsyQuestionnaires::Validation
  include BiopsyQuestionnaires::ExportFormat

  belongs_to :patient

  enum preoperative_urine_examination_type: { dipstick: 0, culture: 1 }, _prefix: true
end
