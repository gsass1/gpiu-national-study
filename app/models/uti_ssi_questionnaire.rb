class UtiSsiQuestionnaire < ApplicationRecord
  include AdminResource
  include Discard::Model
  include Questionnaire
  include SaveWithErrors

  belongs_to :patient

  enum form_type: [:uti, :ssi]
end
