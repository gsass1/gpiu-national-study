# frozen_string_literal: true

module SusceptibilityTests
  module Validation
    extend ActiveSupport::Concern

    included do
      validates :pos_id, presence: { strict: true }

      with_options unless: :new_record? do
        validates :pathogen, inclusion: { in: SusceptibilityTest::PATHOGENS }
        validates :pathogen_specify, presence: true, if: :needs_pathogen_specification?
        validates :cfu, presence: true

        validate :antibiotics_specification
        validate :sensitivity_specification
      end
    end

    private

    def antibiotics_specification
      for_each_antibiotic_group do |group|
        errors.add(group[:field], 'must specify') if send(group[:field]) && !group_has_specification?(group)
      end
    end

    def group_has_specification?(group)
      return true unless group.key?(:sub_fields)

      group[:sub_fields].any? { |field| !!send(field[:field]) }
    end

    def sensitivity_specification
      for_each_antibiotic_field do |field|
        validate_sensitivity(field) unless send(field[:field]) != true
      end
    end

    def validate_sensitivity(field)
      sensitivity_field = "#{field[:field]}_s"
      unless send(sensitivity_field).in?(SusceptibilityTest::SENSITIVITY_CODES)
        errors.add(sensitivity_field,
                   'must choose sensitivity')
      end
    end

    def needs_pathogen_specification?
      SusceptibilityTest::OTHER_PATHOGENS.include?(pathogen)
    end
  end
end
