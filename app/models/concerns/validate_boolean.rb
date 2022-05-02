# frozen_string_literal: true

module ValidateBoolean
  extend ActiveSupport::Concern

  class_methods do
    def validates_boolean(field, options = {})
      validates field, inclusion: { in: [true, false], message: 'must be selected' }, **options
    end

    def validates_yes_no_unknown(field, options = {})
      validates field, inclusion: { in: %w[yes no unknown], message: 'must be selected' }, **options
    end
  end
end
