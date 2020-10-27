class UtiSsiQuestionnaire < ApplicationRecord
  include AdminResource
  include Discard::Model
  include Questionnaire
  include SaveWithErrors

  include Antibiotics
  include Comorbidity
  include CultureResult

  belongs_to :patient

  enum form_type: [:uti, :ssi]

  def appendix_antibiotics_count
    2
  end
end
