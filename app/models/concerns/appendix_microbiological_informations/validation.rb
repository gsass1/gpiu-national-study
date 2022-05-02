# frozen_string_literal: true

module AppendixMicrobiologicalInformations
  module Validation
    extend ActiveSupport::Concern

    included do
      validates :proven, presence: true
      validates :culture_antibiotics, presence: true

      validates :culture_tissue_other_specify, presence: true, if: :culture_tissue_other
      validate :selected_culture_tissue, if: proc { |f| f.proven == 'yes' }

      validates_associated :culture_result_urine, if: :culture_tissue_urine
      validates_associated :culture_result_blood, if: :culture_tissue_blood
      validates_associated :culture_result_swab, if: :culture_tissue_swab
      validates_associated :culture_result_other, if: :culture_tissue_other
    end

    private

    def selected_culture_tissue
      selected_any = culture_tissue_urine || culture_tissue_blood || culture_tissue_swab || culture_tissue_other
      errors.add(:proven, message: 'Please select culture tissue.') unless selected_any
    end
  end
end
