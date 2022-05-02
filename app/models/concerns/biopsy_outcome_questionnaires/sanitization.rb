# frozen_string_literal: true

module BiopsyOutcomeQuestionnaires
  module Sanitization
    extend ActiveSupport::Concern

    included do
      before_validation :sanitize_attributes, on: :update
    end

    def sanitize_attributes
    end
  end
end
