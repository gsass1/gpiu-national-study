# frozen_string_literal: true

module AppendixMicrobiologicalInformations
  module Sanitization
    extend ActiveSupport::Concern

    included do
      before_validation :sanitize_culture_origin, unless: proc { |f| f.proven == 'yes' }
      before_validation :sanitize_culture_origin_other_specification, unless: :culture_tissue_other

      after_save :purge_old_culture_results
    end

    private

    def sanitize_culture_origin
      self.culture_tissue_urine = false
      self.culture_tissue_blood = false
      self.culture_tissue_swab = false
      self.culture_tissue_other = false
    end

    def sanitize_culture_origin_other_specification
      self.culture_tissue_other_specify = nil
    end

    def purge_old_culture_results
      # TODO: it should be possible to "clear" culture results when the
      # corresponding flags changes to false

      # culture_result_urine.destroy if culture_tissue_urine_previously_changed?(to: false)
      # culture_result_blood.destroy if culture_tissue_blood_previously_changed?(to: false)
      # culture_result_swab.destroy if culture_tissue_swab_previously_changed?(to: false)
      # culture_result_other.destroy if culture_tissue_other_previously_changed?(to: false)
    end
  end
end
