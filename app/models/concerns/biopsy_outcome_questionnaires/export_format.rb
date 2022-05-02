# frozen_string_literal: true

module BiopsyOutcomeQuestionnaires
  module ExportFormat
    extend ActiveSupport::Concern

    included do
      exports_as do |e, p|
        e.prefix '1' do
          e.value 'i', p.histopathology_analysis
          if p.histopathology_analysis == 'yes'
            e.value 'i.a', p.histopathology_biopsy_material_change
            if p.histopathology_biopsy_material_change == 'yes'
              e.value 'i.a.1', p.histopathology_biopsy_material_change_severity
            end
          end

          e.value 'ii', p.outcome_analysis
          if p.outcome_analysis == 'yes'
            e.value 'ii.a', p.outcome_analysis_form_control_visit
          end

          e.value 'iii', p.outcome_analysis_urinary_tract_infection
          if p.outcome_analysis_urinary_tract_infection == 'yes'
            e.value 'iii.a', p.outcome_analysis_dysuria
            e.value 'iii.b', p.outcome_analysis_frequency
            e.value 'iii.c', p.outcome_analysis_urgency
            e.value 'iii.d', p.outcome_analysis_prostate_pain
            e.value 'iii.e', p.outcome_analysis_rigor
            e.value 'iii.f', p.outcome_analysis_loin_pain
            e.value 'iii.g', p.outcome_analysis_fever
          end

          e.value 'iv', p.physician_visit
          if p.physician_visit
            e.value 'iv.a', p.physician_visit_care_clinician
            e.value 'iv.b', p.physician_visit_emergency_room
            e.value 'iv.c', p.physician_visit_admission_hospital
            if p.physician_visit_admission_hospital == 'yes'
              e.value 'iv.c.1', p.physician_visit_admission_hospital_urology
              e.value 'iv.c.2', p.physician_visit_admission_hospital_internal_medicine
              e.value 'iv.c.3', p.physician_visit_admission_hospital_intensive_care
            end

            e.value 'iv.d', p.physician_visit_psa
            if p.physician_visit_psa == 'yes'
              e.value 'iv.d.1', p.physician_visit_psa_value
            end

            e.value 'iv.e', p.physician_visit_wbc_count
            if p.physician_visit_psa == 'yes'
              e.value 'iv.e.1', p.physician_visit_wbc_value
            end

            e.value 'iv.f', p.physician_visit_crp
            if p.physician_visit_psa == 'yes'
              e.value 'iv.f.1', p.physician_visit_crp_value
            end

            e.value 'iv.g', p.physician_visit_urine_culture
            if p.physician_visit_urine_culture == 'yes'
              e.value 'iv.g.1', p.physician_visit_urine_culture_result
              if p.physician_visit_urine_culture_result == 'culture_positive'
                e.export p.appendix_culture_result, prefix: 'iv.g.1'
              end
            end
          end

          e.value 'v', p.antibiotic_treatment
          if p.antibiotic_treatment == 'yes'
            e.value 'v.a', p.antibiotics_type
            e.value 'v.b', p.antibiotics_dosage
            e.value 'v.c', p.antibiotics_duration
            e.value 'v.d', p.antibiotics_route
          end

          e.value 'vi', p.outcome
        end
      end
    end
  end
end
