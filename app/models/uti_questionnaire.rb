class UtiQuestionnaire < ApplicationRecord
  include AdminResource
  include Discard::Model
  include Questionnaire
  include SaveWithErrors

  belongs_to :patient
end
