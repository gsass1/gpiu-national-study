# frozen_string_literal: true

module Csv
  class Patient < Csv::Writer
    def add_columns_proc(*prefixes)
      proc do |column|
        val = prefixes.reduce(@p) do |r, prefix|
          r.try(prefix)
        end.try(column)

        col "#{prefixes.join('.')}.#{column}", val
      end
    end

    def add_columns(clazz, *prefixes)
      column_names = clazz.column_names.reject { |c| %w[created_at updated_at].include?(c) }
      clazz.column_names.each(&add_columns_proc(*prefixes))
    end

    def row(p)
      @p = p

      col 'ID',        p.id
      col 'Initial',   p.initial
      col 'Department ID', p.department.id
      col 'Hospital ID', p.department.hospital.id
      # col 'State', p.state
      col 'Locked', p.locked
      col 'Study Iteration ID', p.study_iteration_id

      if p.uti_ssi?
        # Identification
        add_columns PatientIdentification, 'patient_identification'

        # Section 1
        add_columns AppendixComorbidity, 'uti_ssi_history', 'appendix_comorbidity'

        # Section 2
        add_columns AppendixUrologicalRiskFactor, 'uti_ssi_history', 'appendix_urological_risk_factor'
        add_columns AppendixUrinaryTractObstruction, 'uti_ssi_history', 'appendix_urological_risk_factor',
                    'left_urinary_tract_obstruction'
        add_columns AppendixUrinaryTractObstruction, 'uti_ssi_history', 'appendix_urological_risk_factor',
                    'right_urinary_tract_obstruction'
        add_columns AppendixAntibiotic, 'uti_ssi_history', 'appendix_urological_risk_factor', 'appendix_antibiotic'

        # Section 3
        add_columns AppendixUrologicalIntervention, 'uti_ssi_history', 'appendix_urological_intervention'

        # Section 4
        add_columns AppendixClinicalDiagnosis, 'uti_ssi_history', 'appendix_clinical_diagnosis'

        if p.uti_form_needed?
          # Section 5
          add_columns AppendixMicrobiologicalInformation, 'uti_questionnaire', 'appendix_microbiological_information'

          if p.uti_questionnaire.appendix_microbiological_information.culture_tissue_urine
            add_columns AppendixCultureResult, 'uti_questionnaire', 'appendix_microbiological_information',
                        'culture_result_urine'
          end

          if p.uti_questionnaire.appendix_microbiological_information.culture_tissue_blood
            add_columns AppendixCultureResult, 'uti_questionnaire', 'appendix_microbiological_information',
                        'culture_result_blood'
          end

          if p.uti_questionnaire.appendix_microbiological_information.culture_tissue_swab
            add_columns AppendixCultureResult, 'uti_questionnaire', 'appendix_microbiological_information',
                        'culture_result_swab'
          end

          if p.uti_questionnaire.appendix_microbiological_information.culture_tissue_other
            add_columns AppendixCultureResult, 'uti_questionnaire', 'appendix_microbiological_information',
                        'culture_result_other'
          end

          add_columns AppendixAntibiotic, 'uti_questionnaire', 'appendix_microbiological_information',
                      'appendix_antibiotic'

          # Section 6
          add_columns AppendixAntimicrobialTreatment, 'uti_questionnaire', 'appendix_antimicrobial_treatment'
          add_columns AppendixAntibiotic, 'uti_questionnaire', 'appendix_antimicrobial_treatment', 'appendix_antibiotic'
        end

        if p.ssi_form_needed?
          # Section 5
          add_columns AppendixMicrobiologicalInformation, 'ssi_questionnaire', 'appendix_microbiological_information'

          if p.ssi_questionnaire.appendix_microbiological_information.culture_tissue_urine
            add_columns AppendixCultureResult, 'ssi_questionnaire', 'appendix_microbiological_information',
                        'culture_result_urine'
          end

          if p.ssi_questionnaire.appendix_microbiological_information.culture_tissue_blood
            add_columns AppendixCultureResult, 'ssi_questionnaire', 'appendix_microbiological_information',
                        'culture_result_blood'
          end

          if p.ssi_questionnaire.appendix_microbiological_information.culture_tissue_swab
            add_columns AppendixCultureResult, 'ssi_questionnaire', 'appendix_microbiological_information',
                        'culture_result_swab'
          end

          if p.ssi_questionnaire.appendix_microbiological_information.culture_tissue_other
            add_columns AppendixCultureResult, 'ssi_questionnaire', 'appendix_microbiological_information',
                        'culture_result_other'
          end

          add_columns AppendixAntibiotic, 'ssi_questionnaire', 'appendix_microbiological_information',
                      'appendix_antibiotic'

          # Section 6
          add_columns AppendixAntimicrobialTreatment, 'ssi_questionnaire', 'appendix_antimicrobial_treatment'
          add_columns AppendixAntibiotic, 'ssi_questionnaire', 'appendix_antimicrobial_treatment', 'appendix_antibiotic'
        end
      elsif p.prostate_biopsy?
        add_columns BiopsyQuestionnaire, 'biopsy_questionnaire'
        add_columns AppendixCultureResult, 'biopsy_questionnaire', 'appendix_culture_result'

        add_columns BiopsyOutcomeQuestionnaire, 'biopsy_outcome_questionnaire'
        add_columns AppendixCultureResult, 'biopsy_outcome_questionnaire', 'appendix_culture_result'
      end
    end
  end
end
