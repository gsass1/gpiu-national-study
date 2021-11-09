# frozen_string_literal: true

class AppendixComorbidity < ApplicationRecord
  include Discard::Model

  belongs_to :questionnaire, polymorphic: true
  validates :pos_id, presence: { strict: true }
end
