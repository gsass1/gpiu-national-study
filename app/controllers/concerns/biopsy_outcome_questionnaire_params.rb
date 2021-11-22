# frozen_string_literal: true

module BiopsyOutcomeQuestionnaireParams
  extend ActiveSupport::Concern

  private

  def biopsy_outcome_questionnaire_permitted_params
    [
      :histopathology_analysis,
      :histopathology_biopsy_material_change,
      :histopathology_biopsy_material_change_severity,
      :outcome_analysis,
      :outcome_analysis_form_control_visit,
      :outcome_analysis_urinary_tract_infection,
      :outcome_analysis_dysuria,
      :outcome_analysis_frequency,
      :outcome_analysis_urgency,
      :outcome_analysis_prostate_pain,
      :outcome_analysis_rigor,
      :outcome_analysis_loin_pain,
      :outcome_analysis_fever,
      :physician_visit,
      :physician_visit_care_clinician,
      :physician_visit_emergency_room,
      :physician_visit_admission_hospital,
      :physician_visit_admission_hospital_urology,
      :physician_visit_admission_hospital_internal_medicine,
      :physician_visit_admission_hospital_intensive_care,
      :physician_visit_psa,
      :physician_visit_psa_value,
      :physician_visit_wbc_count,
      :physician_visit_wbc_value,
      :physician_visit_crp,
      :physician_visit_crp_value,
      :physician_visit_urine_culture,
      :physician_visit_urine_culture_result,
      :antibiotic_treatment,
      :antibiotics_type,
      :antibiotics_dosage,
      :antibiotics_duration,
      :antibiotics_route,
      :outcome,
      { appendix_culture_result_attributes: appendix_culture_result_params }

    ]
  end
end
