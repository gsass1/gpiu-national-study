# frozen_string_literal: true

module AppendixClinicalDiagnoses
  module Validation
    extend ActiveSupport::Concern

    included do
      validates :diagnosis_date_uti, presence: true, prior: true, if: :uti_form_needed?
      validates :diagnosis_uti, presence: { if: :uti_form_needed? }
      validate :any_cdc_uti, if: :uti_form_needed?
      validate :asymptomatic_bacteriuria_catheter, if: :uti_form_needed?
      validates :diagnosis_specify_uti, presence: { if: proc { |f| f.diagnosis_uti == 'other' } }

      validates :diagnosis_date_ssi, presence: true, prior: true, if: :ssi_form_needed?
      validates :diagnosis_ssi, presence: { if: :ssi_form_needed? }
      validates :diagnosis_specify_ssi, presence: { if: proc { |f| f.diagnosis_ssi == 'other' } }
    end

    private

    def any_cdc_uti
      if cdc_uti_symptomatic_uti_and_bacteria || cdc_uti_symptomatic_uti_and_other || cdc_uti_asymptomatic_bact_cath || cdc_uti_asymptomatic_bact_nocatch || cdc_uti_other
        return
      end

      errors.add(:cdc_uti_other, 'must choose at least one CDC definition')
    end

    def asymptomatic_bacteriuria_catheter
      if cdc_uti_asymptomatic_bact_cath && cdc_uti_asymptomatic_bact_nocatch
        errors.add(:cdc_uti_asymptomatic_bact_nocatch, 'must select only one definition of asymptomatic bacteriuria')
      end
    end
  end
end
