# frozen_string_literal: true

module AppendixClinicalDiagnoses
  module ExportFormat
    extend ActiveSupport::Concern

    included do
      exports_as do |e, p|
        e.prefix 'i' do
          e.value 'a', p.diagnosis_date_uti if p.uti_form_needed?
          e.value 'b', p.diagnosis_date_ssi if p.ssi_form_needed?
        end

        e.prefix 'ii' do
          if p.uti_form_needed?
            e.value 'a', p.diagnosis_uti
            e.value 'a_specify', p.diagnosis_specify_uti if p.diagnosis_uti == 'other'
          end

          if p.ssi_form_needed?
            e.value 'b', p.diagnosis_ssi
            e.value 'b_specify', p.diagnosis_specify_ssi if p.diagnosis_ssi == 'other'
          end
        end

        e.prefix 'iii' do
          if p.uti_form_needed?
            e.prefix 'a' do
              e.value '1', p.cdc_uti_symptomatic_uti_and_bacteria
              e.value '2', p.cdc_uti_symptomatic_uti_and_other
              e.value '3', p.cdc_uti_asymptomatic_bact_cath
              e.value '4', p.cdc_uti_asymptomatic_bact_nocatch
              e.value '5', p.cdc_uti_other
              e.value '5_specify', p.cdc_uti_other_specify if p.cdc_uti_other
            end
          end

          if p.ssi_form_needed?
            e.prefix 'b' do
              e.value '1', p.cdc_ssi_superficial
              e.value '2', p.cdc_ssi_deep
              e.value '3', p.cdc_ssi_organ
            end
          end
        end
      end
    end
  end
end
