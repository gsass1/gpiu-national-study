# frozen_string_literal: true

module Patients
  module ExportFormat
    extend ActiveSupport::Concern

    included do
      exports_as do |e, p|
        e.prefix 'patient' do
          e.value 'id', p.id
          e.value 'identification_state', p.identification_state
          e.value 'uti_state', p.uti_state
          e.value 'ssi_state', p.ssi_state
          e.value 'biopsy_state', p.biopsy_state
          e.value 'biopsy_outcome_state', p.biopsy_outcome_state
        end

        if p.uti_ssi?
          e.export p.patient_identification, prefix: 'ident'

          if p.uti_form_needed?
            e.export p.uti_ssi_history.appendix_comorbidity, prefix: 'uti.1'
            e.export p.uti_ssi_history.appendix_urological_risk_factor, prefix: 'uti.2'
            e.export p.uti_ssi_history.appendix_urological_intervention, prefix: 'uti.3'
            e.export p.uti_ssi_history.appendix_clinical_diagnosis, prefix: 'uti.4'
            e.export p.uti_questionnaire.appendix_microbiological_information, prefix: 'uti.5'
            e.export p.uti_questionnaire.appendix_antimicrobial_treatment, prefix: 'uti.6'
          end

          if p.ssi_form_needed?
            e.export p.uti_ssi_history.appendix_comorbidity, prefix: 'ssi.1'
            e.export p.uti_ssi_history.appendix_urological_risk_factor, prefix: 'ssi.2'
            e.export p.uti_ssi_history.appendix_urological_intervention, prefix: 'ssi.3'
            e.export p.uti_ssi_history.appendix_clinical_diagnosis, prefix: 'ssi.4'
            e.export p.ssi_questionnaire.appendix_microbiological_information, prefix: 'ssi.5'
            e.export p.ssi_questionnaire.appendix_antimicrobial_treatment, prefix: 'ssi.6'
          end
        elsif p.prostate_biopsy?
          e.export p.biopsy_questionnaire, prefix: 'pbx'
          e.export p.biopsy_outcome_questionnaire, prefix: 'pbx_outcome'
        end
      end
    end
  end
end
