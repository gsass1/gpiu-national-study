# frozen_string_literal: true

module AppendixComorbidities
  module Validation
    extend ActiveSupport::Concern

    included do
      validates :pos_id, presence: { strict: true }

      validate :any_severity_one?, if: :severity_one
      validate :any_severity_two?, if: :severity_two
      validate :any_severity_three?, if: :severity_three
      validate :any_severity_four?, if: :severity_four
    end

    private

    def any_severity_one?
      any_severity?(:one)
    end

    def any_severity_two?
      any_severity?(:two)
    end

    def any_severity_three?
      any_severity?(:three)
    end

    def any_severity_four?
      any_severity?(:four)
    end

    def any_severity?(level)
      any = AppendixComorbidity::SEVERITY_LEVELS[level].inject(false) { |cond, v| cond || send(v) }
      unless any
        errors.add("severity_#{level}".to_sym,
                   message: 'must select at least one diagnosis under this category')
      end
    end
  end
end
