module AppendixAntibioticParams
  extend ActiveSupport::Concern

  private

  def appendix_antibiotic_params
    [
      :pos_id,
      :id,
      *AppendixAntibiotic::GROUPS,
      *(AppendixAntibiotic::GROUPS.map { |group| "#{group}_group" }),
      #antibiotic_appendix_regimens_attributes: [:pos_id, :id, :unit, :dosage, :regimen_day, :regimen_each]
    ]
  end
end
