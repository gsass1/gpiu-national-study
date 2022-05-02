# frozen_string_literal: true

module BiopsyQuestionnaires
  module Validation
    extend ActiveSupport::Concern

    included do
      validates :age, presence: true, numericality: { greater_than: 0 }

      validate_yes_no_unknown :antibiotics_preceding_months
      with_options if: proc { |f| f.antibiotics_preceding_months == 'yes' } do |group|
        group.validates :antibiotics_dosage, presence: true
        group.validates :antibiotics_duration, presence: true, numericality: true
        group.validates :antibiotics_route, inclusion: { in: %w[oral iv im], message: 'please select' }
      end

      validate_yes_no_unknown :urogenital_infection_preceding_months
      validate_yes_no_unknown :urinary_catheter
      validate_yes_no_unknown :prostate_size_measured
      validate_yes_no_unknown :diabetes_mellitus
      validate_yes_no_unknown :psa

      validates :urinary_catheter_duration,
        presence: true,
        numericality: { greater_than_or_equal_to: 0 },
        if: proc { |f| f.urinary_catheter == 'yes' }

      validates :prostate_size,
        presence: true,
        numericality: { greater_than_or_equal_to: 0 },
        if: proc { |f| f.prostate_size_measured == 'yes' }

      validates :psa_size,
        presence: true,
        numericality: { greater_than_or_equal_to: 0 },
        if: proc { |f| f.psa == 'yes' }

      validate_yes_no_unknown :repeated_biopsy
      validates :repeated_biopsy_number_previous_procedures,
        presence: true,
        numericality: { greater_than_or_equal_to: 1 },
        if: proc { |f| f.repeated_biopsy == 'yes' }

      validate_yes_no_unknown :preoperative_urine_examination
      validate_yes_no_unknown :preoperative_bowel_preparation

      validate_yes_no_unknown :antibiotic_prophylaxis
      with_options if: proc { |f| f.antibiotic_prophylaxis == 'yes' } do
        validates :antibiotic_prophylaxis_type, presence: true
        validates :antibiotic_prophylaxis_dosage, presence: true, numericality: { greater_than_or_equal_to: 0 }
        validates :antibiotic_prophylaxis_duration, presence: true, numericality: { greater_than_or_equal_to: 0 }
        validates :antibiotic_prophylaxis_route, presence: true
      end

      validate_yes_no_unknown :biopsy_anesthesia
      validates :number_cores_taken, inclusion: { in: ::BiopsyQuestionnaire::NUM_CORES_OPTIONS }
    end
  end
end
