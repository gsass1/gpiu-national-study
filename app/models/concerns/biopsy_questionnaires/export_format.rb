# frozen_string_literal: true

module BiopsyQuestionnaires
  module ExportFormat
    extend ActiveSupport::Concern

    included do
      exports_as do |e, p|
        e.prefix '1' do
          e.value 'i', p.age
          e.value 'ii', p.antibiotics_preceding_months

          if p.antibiotics_preceding_months == 'yes'
            e.value 'ii.a', p.antibiotics_type
            e.value 'ii.b', p.antibiotics_dosage
            e.value 'ii.c', p.antibiotics_duration
            e.value 'ii.d', p.antibiotics_route
          end

          e.value 'iii', p.urogenital_infection_preceding_months

          e.value 'iv', p.urinary_catheter
          e.value 'iv.a', p.urinary_catheter_duration if p.urinary_catheter == 'yes'

          e.value 'v', p.prostate_size_measured
          e.value 'v.a', p.prostate_size if p.psa == 'yes'

          e.value 'vi', p.diabetes_mellitus
        end

        e.prefix '2' do
          e.value 'i', p.psa
          e.value 'i.a', p.psa_size if p.psa == 'yes'

          e.value 'ii', p.repeated_biopsy
          e.value 'ii.a', p.repeated_biopsy_number_previous_procedures if p.repeated_biopsy == 'yes'
        end

        e.prefix '3' do
          e.value 'i', p.preoperative_urine_examination
          if p.preoperative_urine_examination == 'yes'
            e.value 'i.a', p.preoperative_urine_examination_type
            if p.preoperative_urine_examination_type == 'culture'
              e.value 'i.a.1', p.preoperative_urine_culture_result
              if p.preoperative_urine_culture_result == 'culture_positive'
                e.export p.appendix_culture_result, prefix: 'i.a.1'
              end
            end
          end

          e.value 'ii', p.preoperative_bowel_preparation
          if p.preoperative_bowel_preparation == 'yes'
            e.value 'ii.a', p.preoperative_bowel_preparation_type
          end

          e.value 'iii', p.antibiotic_prophylaxis
          if p.antibiotic_prophylaxis == 'yes'
            e.value 'iii.a', p.antibiotic_prophylaxis_type
            e.value 'iii.b', p.antibiotic_prophylaxis_dosage
            e.value 'iii.c', p.antibiotic_prophylaxis_duration
            e.value 'iii.d', p.antibiotic_prophylaxis_route
          end

          e.value 'iv', p.biopsy_anesthesia
          if p.biopsy_anesthesia == 'yes'
            e.value 'iv.a', p.biopsy_anesthesia_type
          end

          e.value 'v', p.biopsy_route
          e.value 'vi', p.number_cores_taken
        end
      end
    end
  end
end
