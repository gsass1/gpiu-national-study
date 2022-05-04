# frozen_string_literal: true

class AppendixMicrobiologicalInformation < ApplicationRecord
  include Antibiotic
  include CultureResults
  include Exportable
  include SaveWithErrors

  include AppendixMicrobiologicalInformations::Sanitization
  include AppendixMicrobiologicalInformations::Validation
  include AppendixMicrobiologicalInformations::ExportFormat

  belongs_to :questionnaire, polymorphic: true, optional: true

  after_save_commit :reset_culture_results

  def appendix_culture_result_count
    4
  end

  def culture_result_urine
    @culture_result_urine ||= get_culture_result(0)
  end

  def culture_result_blood
    @culture_result_blood ||= get_culture_result(1)
  end

  def culture_result_swab
    @culture_result_swab ||= get_culture_result(2)
  end

  def culture_result_other
    @culture_result_other ||= get_culture_result(3)
  end

  private

  # If we don't do this the frontend won't update the culture result form
  # immediately
  def reset_culture_results
    @culture_result_urine = nil
    @culture_result_blood = nil
    @culture_result_swab = nil
    @culture_result_other = nil
  end
end
