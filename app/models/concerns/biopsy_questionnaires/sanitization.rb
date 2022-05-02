# frozen_string_literal: true

module BiopsyQuestionnaires
  module Sanitization
    extend ActiveSupport::Concern

    included do
      before_validation :sanitize_attributes, on: :update
    end

    def sanitize_attributes
      unless antibiotics_preceding_months == 'yes'
        self.antibiotics_type = nil
        self.antibiotics_dosage = nil
        self.antibiotics_duration = nil
        self.antibiotics_route = nil
      end

      self.urinary_catheter_duration = nil unless urinary_catheter == 'yes'

      self.prostate_size = nil unless prostate_size_measured == 'yes'

      self.psa_size = nil unless psa == 'yes'

      self.repeated_biopsy_number_previous_procedures = nil unless repeated_biopsy == 'yes'

      self.preoperative_urine_examination_type = nil unless preoperative_urine_examination == 'yes'

      self.preoperative_urine_culture_result = nil unless preoperative_urine_examination_type == 'culture'

      unless preoperative_urine_culture_result == 'culture_positive'
        # TODO: reset appendix culture result
      end

      self.preoperative_bowel_preparation_type = nil unless preoperative_bowel_preparation == 'yes'

      unless antibiotic_prophylaxis == 'yes'
        self.antibiotic_prophylaxis_type = nil
        self.antibiotic_prophylaxis_dosage = nil
        self.antibiotic_prophylaxis_duration = nil
        self.antibiotic_prophylaxis_route = nil
      end

      self.biopsy_anesthesia_type = nil unless biopsy_anesthesia == 'yes'
    end
  end
end
