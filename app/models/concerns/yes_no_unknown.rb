module YesNoUnknown
  extend ActiveSupport::Concern

  class_methods do
    def validate_yes_no_unknown(field, options={})
      enum field => [:yes, :no, :unknown], _prefix: true
      validates field, presence: true, **options
    end

    def validate_if_yes(field, &block)
      with_options if: Proc.new { |f| f.send(field) == :yes }, &block
    end
  end
end
