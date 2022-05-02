# frozen_string_literal: true

module AppendixClinicalDiagnoses
  module Sanitization
    extend ActiveSupport::Concern

    included do
      before_validation :sanitize_diagnosis_specification_uti, unless: proc { |f| f.diagnosis_uti == 'other' }
      before_validation :sanitize_diagnosis_specification_ssi, unless: proc { |f| f.diagnosis_ssi == 'other' }

      before_validation :sanitize_cdc_uti_specification, unless: :cdc_uti_other
    end

    private

    def sanitize_diagnosis_specification_uti
      self.diagnosis_specify_uti = nil
    end

    def sanitize_diagnosis_specification_ssi
      self.diagnosis_specify_ssi = nil
    end

    def sanitize_cdc_uti_specification
      self.cdc_uti_other_specify = nil
    end
  end
end
