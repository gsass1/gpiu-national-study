class CreateBiopsyOutcomeQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :biopsy_outcome_questionnaires do |t|
      t.references :patient, null: false, foreign_key: true
      t.datetime :discarded_at

      t.integer "histopathology_analysis"
      t.integer "histopathology_biopsy_material_change"
      t.integer "histopathology_biopsy_material_change_severity"
      t.integer "outcome_analysis"
      t.string "outcome_analysis_form_control_visit", limit: 20
      t.integer "outcome_analysis_urinary_tract_infection"
      t.boolean "outcome_analysis_dysuria", default: false
      t.boolean "outcome_analysis_frequency", default: false
      t.boolean "outcome_analysis_urgency", default: false
      t.boolean "outcome_analysis_prostate_pain", default: false
      t.boolean "outcome_analysis_rigor", default: false
      t.boolean "outcome_analysis_loin_pain", default: false
      t.boolean "outcome_analysis_fever", default: false
      t.integer "physician_visit"
      t.integer "physician_visit_care_clinician"
      t.integer "physician_visit_emergency_room"
      t.integer "physician_visit_admission_hospital"
      t.boolean "physician_visit_admission_hospital_urology", default: false
      t.boolean "physician_visit_admission_hospital_internal_medicine", default: false
      t.boolean "physician_visit_admission_hospital_intensive_care", default: false
      t.integer "physician_visit_psa"
      t.bigint "physician_visit_psa_value"
      t.integer "physician_visit_wbc_count"
      t.bigint "physician_visit_wbc_value"
      t.integer "physician_visit_crp"
      t.bigint "physician_visit_crp_value"
      t.integer "physician_visit_urine_culture"
      t.string "physician_visit_urine_culture_result", limit: 20
      t.integer "antibiotic_treatment"
      t.string "antibiotics_type", limit: 255
      t.string "antibiotics_dosage", limit: 255
      t.bigint "antibiotics_duration"
      t.string "antibiotics_route", limit: 5
      t.string "outcome", limit: 15

      t.timestamps
    end
  end
end
