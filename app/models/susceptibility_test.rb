# frozen_string_literal: true

class SusceptibilityTest < ApplicationRecord
  include Exportable

  include SusceptibilityTests::ExportFormat
  include SusceptibilityTests::Pathogens
  include SusceptibilityTests::Sanitization
  include SusceptibilityTests::Validation

  belongs_to :appendix_culture_result, optional: true

  enum cfu: {
    '≥ 10^2': 1,
    '≥ 10^3': 2,
    '≥ 10^4': 3,
    '≥ 10^5': 4,
    '≥ 10^6': 5
  }

  SENSITIVITY_CODES = [0, 1, 2].freeze

  def div_id
    "#{appendix_culture_result.pos_id}_#{pos_id}"
  end

  private

  def for_each_antibiotic_field(fields = SUSCEPTIBILITY_FIELDS, &block)
    fields.each do |field|
      if field.key?(:sub_fields)
        for_each_antibiotic_field(field[:sub_fields], &block)
      else
        block.call(field)
      end
    end
  end

  def for_each_antibiotic_group(&block)
    SusceptibilityTest::SUSCEPTIBILITY_FIELDS.each do |field|
      block.call(field)
    end
  end
end
