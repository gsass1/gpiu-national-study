class UtiSsiQuestionnaire < ApplicationRecord
  include AdminResource
  include Discard::Model
  include Questionnaire
  include SaveWithErrors

  include Comorbidity

  belongs_to :patient

  enum form_type: [:uti, :ssi]
end
