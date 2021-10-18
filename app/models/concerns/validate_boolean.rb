module ValidateBoolean
  extend ActiveSupport::Concern

  class_methods do
    def validates_boolean(field, options={})
      validates field, inclusion: { in: [true, false] }, **options
    end
  end
end
