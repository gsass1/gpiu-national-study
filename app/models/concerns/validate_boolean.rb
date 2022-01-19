# frozen_string_literal: true

module ValidateBoolean
  extend ActiveSupport::Concern

  class_methods do
    def validates_boolean(field, options = {})
      validates field, inclusion: { in: [true, false], message: 'Please select.'}, **options
    end
  end
end
