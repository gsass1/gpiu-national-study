# frozen_string_literal: true

class AppendixAntimicrobialTreatment < ApplicationRecord
  include Antibiotic
  include Exportable
  include SaveWithErrors

  include AppendixAntimicrobialTreatments::Validation
  include AppendixAntimicrobialTreatments::ExportFormat

  belongs_to :questionnaire, polymorphic: true, optional: true
end
