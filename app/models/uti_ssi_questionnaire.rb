class UtiSsiQuestionnaire < ApplicationRecord
  include Discard::Model
  include Questionnaire
  include SaveWithErrors

  include Antibiotics
  include Comorbidity
  include CultureResult

  belongs_to :patient

  enum form_type: [:uti, :ssi]

  enum antimicrobial_treatment: [:none, :oral, :parenteral, :both], _prefix: true

  def appendix_antibiotics_count
    2
  end
end
