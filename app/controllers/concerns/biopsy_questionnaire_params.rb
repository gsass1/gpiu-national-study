# frozen_string_literal: true

module BiopsyQuestionnaireParams
  extend ActiveSupport::Concern

  private

  def biopsy_questionnaire_permitted_params
    [
      :initial,
      :age,
      :antibiotics_preceding_months,
      :antibiotics_type,
      :antibiotics_dosage,
      :antibiotics_duration,
      :antibiotics_route,
      :urogenital_infection_preceding_months,
      :urinary_catheter,
      :urinary_catheter_duration,
      :prostate_size_measured,
      :prostate_size,
      :diabetes_mellitus,
      :psa,
      :psa_size,
      :repeated_biopsy,
      :repeated_biopsy_number_previous_procedures,
      :preoperative_urine_examination,
      :preoperative_urine_examination_type,
      :preoperative_urine_culture_result,
      :preoperative_bowel_preparation,
      :preoperative_bowel_preparation_type,
      :antibiotic_prophylaxis,
      :antibiotic_prophylaxis_type,
      :antibiotic_prophylaxis_dosage,
      :antibiotic_prophylaxis_duration,
      :antibiotic_prophylaxis_route,
      :biopsy_anesthesia,
      :biopsy_anesthesia_type,
      :biopsy_route,
      :number_cores_taken,
      { appendix_culture_result_attributes: appendix_culture_result_params }
    ]
  end
end
