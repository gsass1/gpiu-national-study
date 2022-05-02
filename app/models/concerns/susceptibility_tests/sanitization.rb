# frozen_string_literal: true

module SusceptibilityTests
  module Sanitization
    extend ActiveSupport::Concern

    included do
      before_validation :sanitize_groups
      before_validation :sanitize_sensitivities
    end

    private

    def sanitize_sensitivities
      for_each_antibiotic_field do |field|
        sensitivity_field = "#{field[:field]}_s"

        send("#{sensitivity_field}=", nil) if send(field[:field]) != true
      end
    end

    def sanitize_groups
      for_each_antibiotic_group do |group|
        if send(group[:field]) != true && group.key?(:sub_fields)
          group[:sub_fields].each { |sub_field| send("#{sub_field[:field]}=", false) }
        end
      end
    end
  end
end
