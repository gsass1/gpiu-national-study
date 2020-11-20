class AppendixComorbidity < ApplicationRecord
  include Discard::Model

  belongs_to :questionnaire, polymorphic: true
  validates_presence_of :pos_id, strict: true
end
