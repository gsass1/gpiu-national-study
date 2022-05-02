# frozen_string_literal: true

class AppendixComorbidity < ApplicationRecord
  include Discard::Model
  include Exportable

  include AppendixComorbidities::Sanitization
  include AppendixComorbidities::Validation
  include AppendixComorbidities::ExportFormat

  belongs_to :questionnaire, polymorphic: true, optional: true

  SEVERITY_LEVELS = {
    one: %i[
      myocardialinfarction
      congestiveheartfailure
      vasculardisease
      cerebrovascular
      dementia
      pulmonary
      tissuedisease
      ulcerdisease
      mildliver
      diabetes
    ],
    two: %i[
      hemiplegia
      renaldisease
      diabetesorgandamage
      tumor
      leukaemia
      lymphoma
    ],
    three: [
      :severeliverdamage
    ],
    four: %i[
      metastatictumor
      aids
    ]
  }.freeze
end
