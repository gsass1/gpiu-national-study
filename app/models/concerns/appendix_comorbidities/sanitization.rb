# frozen_string_literal: true

module AppendixComorbidities
  module Sanitization
    extend ActiveSupport::Concern

    included do
      before_validation :clean_severity_one, unless: :severity_one
      before_validation :clean_severity_two, unless: :severity_two
      before_validation :clean_severity_three, unless: :severity_three
      before_validation :clean_severity_four, unless: :severity_four
    end

    private

    def clean_severity_one
      clean_severity :one
    end

    def clean_severity_two
      clean_severity :two
    end

    def clean_severity_three
      clean_severity :three
    end

    def clean_severity_four
      clean_severity :four
    end

    def clean_severity(level)
      AppendixComorbidity::SEVERITY_LEVELS[level].each { |v| send("#{v}=", false) }
    end
  end
end
