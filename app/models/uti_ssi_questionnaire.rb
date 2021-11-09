# frozen_string_literal: true

class UtiSsiQuestionnaire < ApplicationRecord
  include Discard::Model
  include Questionnaire
  include SaveWithErrors

  include Antibiotics
  include Comorbidity
  include CultureResult

  belongs_to :patient

  enum form_type: { uti: 0, ssi: 1 }

  enum antimicrobial_treatment: { none: 0, oral: 1, parenteral: 2, both: 3 }, _prefix: true

  def appendix_antibiotics_count
    2
  end
end
