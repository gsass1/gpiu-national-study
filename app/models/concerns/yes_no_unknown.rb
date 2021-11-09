# frozen_string_literal: true

module YesNoUnknown
  extend ActiveSupport::Concern

  class_methods do
    def validate_yes_no_unknown(field, options = {})
      enum field => { yes: 0, no: 1, unknown: 2 }, _prefix: true
      validates field, presence: true, **options
    end

    def validate_if_yes(field, &block)
      with_options if: proc { |f| f.send(field) == :yes }, &block
    end
  end
end
