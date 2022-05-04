# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_02_083136) do

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "zip_code"
    t.string "city"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discarded_at"], name: "index_addresses_on_discarded_at"
  end

  create_table "appendix_antibiotics", force: :cascade do |t|
    t.integer "questionnaire_id"
    t.string "questionnaire_type", limit: 255
    t.integer "pos_id"
    t.integer "aminoglycoside"
    t.integer "carbapenem"
    t.integer "glycopeptide"
    t.integer "lincosamide"
    t.integer "macrolide"
    t.integer "monobactam"
    t.integer "nitrofuran"
    t.integer "penicillin"
    t.integer "polypeptide"
    t.integer "quinolone"
    t.integer "tetracycline"
    t.integer "antimycobacterial_drug"
    t.integer "other"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "cephalosporin"
    t.integer "trimethoprim_sulfamethoxazole"
  end

  create_table "appendix_antimicrobial_treatments", force: :cascade do |t|
    t.string "questionnaire_type", null: false
    t.integer "questionnaire_id", null: false
    t.string "treatment", limit: 255
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["questionnaire_type", "questionnaire_id"], name: "index_appendix_antimicrobial_treatments_on_questionnaire"
  end

  create_table "appendix_clinical_diagnoses", force: :cascade do |t|
    t.integer "uti_ssi_history_id", null: false
    t.date "diagnosis_date_uti"
    t.date "diagnosis_date_ssi"
    t.string "diagnosis_uti", limit: 255
    t.string "diagnosis_ssi", limit: 255
    t.text "diagnosis_specify_uti"
    t.text "diagnosis_specify_ssi"
    t.boolean "cdc_uti_symptomatic_uti_and_bacteria", default: false
    t.boolean "cdc_uti_symptomatic_uti_and_other", default: false
    t.boolean "cdc_uti_asymptomatic_bact_cath", default: false
    t.boolean "cdc_uti_asymptomatic_bact_nocatch", default: false
    t.boolean "cdc_uti_other", default: false
    t.text "cdc_uti_other_specify"
    t.boolean "cdc_ssi_superficial", default: false
    t.boolean "cdc_ssi_deep", default: false
    t.boolean "cdc_ssi_organ", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uti_ssi_history_id"], name: "index_appendix_clinical_diagnoses_on_uti_ssi_history_id"
  end

  create_table "appendix_comorbidities", force: :cascade do |t|
    t.integer "questionnaire_id"
    t.string "questionnaire_type", limit: 255
    t.integer "pos_id"
    t.boolean "myocardialinfarction", default: false
    t.boolean "congestiveheartfailure", default: false
    t.boolean "vasculardisease", default: false
    t.boolean "cerebrovascular", default: false
    t.boolean "dementia", default: false
    t.boolean "pulmonary", default: false
    t.boolean "tissuedisease", default: false
    t.boolean "ulcerdisease", default: false
    t.boolean "mildliver", default: false
    t.boolean "diabetes", default: false
    t.boolean "hemiplegia", default: false
    t.boolean "renaldisease", default: false
    t.boolean "diabetesorgandamage", default: false
    t.boolean "tumor", default: false
    t.boolean "leukaemia", default: false
    t.boolean "lymphoma", default: false
    t.boolean "severeliverdamage", default: false
    t.boolean "metastatictumor", default: false
    t.boolean "aids", default: false
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "severity_one", default: false
    t.boolean "severity_two", default: false
    t.boolean "severity_three", default: false
    t.boolean "severity_four", default: false
  end

  create_table "appendix_culture_results", force: :cascade do |t|
    t.bigint "questionnaire_id"
    t.string "questionnaire_type", limit: 255
    t.bigint "pos_id"
    t.bigint "susceptibility_standard"
    t.string "susceptibility_standard_other_specify", limit: 255
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "appendix_microbiological_informations", force: :cascade do |t|
    t.string "questionnaire_type", null: false
    t.integer "questionnaire_id", null: false
    t.string "proven", limit: 255
    t.boolean "culture_tissue_urine", default: false
    t.boolean "culture_tissue_blood", default: false
    t.boolean "culture_tissue_swab", default: false
    t.boolean "culture_tissue_other", default: false
    t.text "culture_tissue_other_specify"
    t.string "culture_antibiotics", limit: 255
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["questionnaire_type", "questionnaire_id"], name: "index_appendix_microbiological_informations_on_questionnaire"
  end

  create_table "appendix_urinary_tract_obstructions", force: :cascade do |t|
    t.integer "appendix_urological_risk_factor_id", null: false
    t.boolean "lower", default: false
    t.boolean "middle", default: false
    t.boolean "upper", default: false
    t.boolean "ureteropelvic_junction", default: false
    t.integer "pos_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appendix_urological_risk_factor_id"], name: "index_tract_obstructions_on_urological_risk_factors"
  end

  create_table "appendix_urological_interventions", force: :cascade do |t|
    t.integer "uti_ssi_history_id", null: false
    t.string "performed_uti", limit: 255
    t.string "performed_ssi", limit: 255
    t.boolean "intervention_endoscopic_uti", default: false
    t.integer "endoscopic_uti", default: 0
    t.text "endoscopic_specify_uti"
    t.boolean "intervention_percutaneous_uti", default: false
    t.integer "percutaneous_uti", default: 0
    t.text "percutaneous_specify_uti"
    t.boolean "intervention_laparoscopic_uti", default: false
    t.integer "laparoscopic_uti", default: 0
    t.text "laparoscopic_specify_uti"
    t.boolean "intervention_open_surgery_uti", default: false
    t.integer "open_surgery_uti", default: 0
    t.text "open_surgery_specify_uti"
    t.boolean "intervention_prostate_biopsy_uti", default: false
    t.integer "prostate_biopsy_uti", default: 0
    t.text "prostate_biopsy_specify_uti"
    t.boolean "intervention_others_uti", default: false
    t.integer "others_uti", default: 0
    t.integer "contamination_uti"
    t.boolean "intervention_endoscopic_ssi", default: false
    t.integer "endoscopic_ssi", default: 0
    t.text "endoscopic_specify_ssi"
    t.boolean "intervention_percutaneous_ssi", default: false
    t.integer "percutaneous_ssi", default: 0
    t.text "percutaneous_specify_ssi"
    t.boolean "intervention_laparoscopic_ssi", default: false
    t.integer "laparoscopic_ssi", default: 0
    t.text "laparoscopic_specify_ssi"
    t.boolean "intervention_open_surgery_ssi", default: false
    t.integer "open_surgery_ssi", default: 0
    t.text "open_surgery_specify_ssi"
    t.boolean "intervention_prostate_biopsy_ssi", default: false
    t.integer "prostate_biopsy_ssi", default: 0
    t.text "prostate_biopsy_specify_ssi"
    t.boolean "intervention_others_ssi", default: false
    t.integer "others_ssi", default: 0
    t.integer "contamination_ssi"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uti_ssi_history_id"], name: "index_appendix_urological_interventions_on_uti_ssi_history_id"
  end

  create_table "appendix_urological_risk_factors", force: :cascade do |t|
    t.integer "uti_ssi_history_id", null: false
    t.boolean "previous"
    t.boolean "tract_obstruction"
    t.boolean "tract_obstruction_left", default: false
    t.boolean "tract_obstruction_right", default: false
    t.boolean "bladder_outlet_obstruction", default: false
    t.string "urinarystones", limit: 255
    t.boolean "urinarystones_calyceal", default: false
    t.boolean "urinarystones_renalpelvic", default: false
    t.boolean "urinarystones_ureteral", default: false
    t.boolean "urinarystones_bladder", default: false
    t.string "antibiotic_treatment", limit: 255
    t.string "antibiotic_treatment_type", limit: 255
    t.text "antibiotic_treatment_specify"
    t.boolean "hospitalisation"
    t.text "hospitalisation_specify"
    t.string "catheter", limit: 255
    t.boolean "catheter_urethral", default: false
    t.boolean "catheter_suprapubic", default: false
    t.boolean "catheter_ureteralstent", default: false
    t.boolean "catheter_nephrostomy", default: false
    t.boolean "catheter_others", default: false
    t.string "catheter_other_specify"
    t.integer "catheterduration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uti_ssi_history_id"], name: "index_appendix_urological_risk_factors_on_uti_ssi_history_id"
  end

  create_table "biopsy_outcome_questionnaires", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.datetime "discarded_at"
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_biopsy_outcome_questionnaires_on_patient_id"
  end

  create_table "biopsy_questionnaires", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.datetime "discarded_at"
    t.bigint "age"
    t.integer "antibiotics_preceding_months"
    t.string "antibiotics_type", limit: 255
    t.string "antibiotics_dosage", limit: 255
    t.bigint "antibiotics_duration"
    t.string "antibiotics_route", limit: 5
    t.integer "urogenital_infection_preceding_months"
    t.integer "urinary_catheter"
    t.bigint "urinary_catheter_duration"
    t.integer "prostate_size_measured"
    t.bigint "prostate_size"
    t.integer "diabetes_mellitus"
    t.integer "psa"
    t.bigint "psa_size"
    t.integer "repeated_biopsy"
    t.bigint "repeated_biopsy_number_previous_procedures"
    t.integer "preoperative_urine_examination"
    t.integer "preoperative_urine_examination_type"
    t.string "preoperative_urine_culture_result", limit: 20
    t.integer "preoperative_bowel_preparation"
    t.string "preoperative_bowel_preparation_type", limit: 25
    t.integer "antibiotic_prophylaxis"
    t.string "antibiotic_prophylaxis_type", limit: 255
    t.string "antibiotic_prophylaxis_dosage", limit: 255
    t.bigint "antibiotic_prophylaxis_duration"
    t.string "antibiotic_prophylaxis_route", limit: 5
    t.integer "biopsy_anesthesia"
    t.string "biopsy_anesthesia_type", limit: 45
    t.string "biopsy_route", limit: 15
    t.string "number_cores_taken", limit: 255
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_biopsy_questionnaires_on_patient_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "iso_2", null: false
    t.string "iso_3", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "timezone", default: "UTC"
    t.index ["iso_2", "iso_3", "name"], name: "index_countries_on_iso_2_and_iso_3_and_name", unique: true
  end

  create_table "department_questionnaires", force: :cascade do |t|
    t.bigint "department_id"
    t.bigint "study_iteration_id", null: false
    t.integer "state", default: 0
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "hospital_beds"
    t.integer "hospital_type"
    t.string "hospital_othertype"
    t.integer "department_beds"
    t.integer "department_admissions"
    t.integer "department_stay"
    t.integer "department_urinecultures"
    t.integer "patient_male"
    t.integer "patient_female"
    t.integer "patient_category1"
    t.integer "patient_category2"
    t.integer "patient_category3"
    t.integer "patient_opensurgery"
    t.integer "patient_endoscopic"
    t.integer "patient_laparoscopic"
    t.integer "patient_prostaticbiopsy"
    t.integer "patient_transurethral_closed"
    t.integer "patient_transurethral_open"
    t.integer "patient_intermittent"
    t.integer "patient_suprapubic"
    t.integer "patient_nephrostromy"
    t.integer "patient_ureteral"
    t.integer "patient_provenuti"
    t.integer "patient_suspecteduti"
    t.integer "patient_otherinfections"
    t.integer "patient_prophylaxis"
    t.boolean "perioperative", default: false
    t.boolean "urinary", default: false
    t.boolean "nautireports", default: false
    t.boolean "pathogens", default: false
    t.boolean "resistance", default: false
    t.integer "b_1_99", limit: 1
    t.integer "b_1_0", limit: 1
    t.integer "b_1_1", limit: 1
    t.integer "b_1_2", limit: 1
    t.integer "b_1_3", limit: 1
    t.integer "b_1_4", limit: 1
    t.integer "b_1_5", limit: 1
    t.integer "b_1_6", limit: 1
    t.integer "b_1_7", limit: 1
    t.integer "b_1_8", limit: 1
    t.integer "b_1_9", limit: 1
    t.integer "b_1_10", limit: 1
    t.integer "b_1_11", limit: 1
    t.integer "b_1_12", limit: 1
    t.integer "b_1_13", limit: 1
    t.integer "b_1_14", limit: 1
    t.integer "b_1_15", limit: 1
    t.integer "b_1_16", limit: 1
    t.integer "b_2_99", limit: 1
    t.integer "b_2_0", limit: 1
    t.integer "b_2_1", limit: 1
    t.integer "b_2_2", limit: 1
    t.integer "b_2_3", limit: 1
    t.integer "b_2_4", limit: 1
    t.integer "b_2_5", limit: 1
    t.integer "b_2_6", limit: 1
    t.integer "b_2_7", limit: 1
    t.integer "b_2_8", limit: 1
    t.integer "b_2_9", limit: 1
    t.integer "b_2_10", limit: 1
    t.integer "b_2_11", limit: 1
    t.integer "b_2_12", limit: 1
    t.integer "b_2_13", limit: 1
    t.integer "b_2_14", limit: 1
    t.integer "b_2_15", limit: 1
    t.integer "b_2_16", limit: 1
    t.integer "b_3_99", limit: 1
    t.integer "b_3_0", limit: 1
    t.integer "b_3_1", limit: 1
    t.integer "b_3_2", limit: 1
    t.integer "b_3_3", limit: 1
    t.integer "b_3_4", limit: 1
    t.integer "b_3_5", limit: 1
    t.integer "b_3_6", limit: 1
    t.integer "b_3_7", limit: 1
    t.integer "b_3_8", limit: 1
    t.integer "b_3_9", limit: 1
    t.integer "b_3_10", limit: 1
    t.integer "b_3_11", limit: 1
    t.integer "b_3_12", limit: 1
    t.integer "b_3_13", limit: 1
    t.integer "b_3_14", limit: 1
    t.integer "b_3_15", limit: 1
    t.integer "b_3_16", limit: 1
    t.integer "b_4_99", limit: 1
    t.integer "b_4_0", limit: 1
    t.integer "b_4_1", limit: 1
    t.integer "b_4_2", limit: 1
    t.integer "b_4_3", limit: 1
    t.integer "b_4_4", limit: 1
    t.integer "b_4_5", limit: 1
    t.integer "b_4_6", limit: 1
    t.integer "b_4_7", limit: 1
    t.integer "b_4_8", limit: 1
    t.integer "b_4_9", limit: 1
    t.integer "b_4_10", limit: 1
    t.integer "b_4_11", limit: 1
    t.integer "b_4_12", limit: 1
    t.integer "b_4_13", limit: 1
    t.integer "b_4_14", limit: 1
    t.integer "b_4_15", limit: 1
    t.integer "b_4_16", limit: 1
    t.integer "b_5_99", limit: 1
    t.integer "b_5_0", limit: 1
    t.integer "b_5_1", limit: 1
    t.integer "b_5_2", limit: 1
    t.integer "b_5_3", limit: 1
    t.integer "b_5_4", limit: 1
    t.integer "b_5_5", limit: 1
    t.integer "b_5_6", limit: 1
    t.integer "b_5_7", limit: 1
    t.integer "b_5_8", limit: 1
    t.integer "b_5_9", limit: 1
    t.integer "b_5_10", limit: 1
    t.integer "b_5_11", limit: 1
    t.integer "b_5_12", limit: 1
    t.integer "b_5_13", limit: 1
    t.integer "b_5_14", limit: 1
    t.integer "b_5_15", limit: 1
    t.integer "b_5_16", limit: 1
    t.integer "b_6_99", limit: 1
    t.integer "b_6_0", limit: 1
    t.integer "b_6_1", limit: 1
    t.integer "b_6_2", limit: 1
    t.integer "b_6_3", limit: 1
    t.integer "b_6_4", limit: 1
    t.integer "b_6_5", limit: 1
    t.integer "b_6_6", limit: 1
    t.integer "b_6_7", limit: 1
    t.integer "b_6_8", limit: 1
    t.integer "b_6_9", limit: 1
    t.integer "b_6_10", limit: 1
    t.integer "b_6_11", limit: 1
    t.integer "b_6_12", limit: 1
    t.integer "b_6_13", limit: 1
    t.integer "b_6_14", limit: 1
    t.integer "b_6_15", limit: 1
    t.integer "b_6_16", limit: 1
    t.integer "b_7_99", limit: 1
    t.integer "b_7_0", limit: 1
    t.integer "b_7_1", limit: 1
    t.integer "b_7_2", limit: 1
    t.integer "b_7_3", limit: 1
    t.integer "b_7_4", limit: 1
    t.integer "b_7_5", limit: 1
    t.integer "b_7_6", limit: 1
    t.integer "b_7_7", limit: 1
    t.integer "b_7_8", limit: 1
    t.integer "b_7_9", limit: 1
    t.integer "b_7_10", limit: 1
    t.integer "b_7_11", limit: 1
    t.integer "b_7_12", limit: 1
    t.integer "b_7_13", limit: 1
    t.integer "b_7_14", limit: 1
    t.integer "b_7_15", limit: 1
    t.integer "b_7_16", limit: 1
    t.integer "b_8_99", limit: 1
    t.integer "b_8_0", limit: 1
    t.integer "b_8_1", limit: 1
    t.integer "b_8_2", limit: 1
    t.integer "b_8_3", limit: 1
    t.integer "b_8_4", limit: 1
    t.integer "b_8_5", limit: 1
    t.integer "b_8_6", limit: 1
    t.integer "b_8_7", limit: 1
    t.integer "b_8_8", limit: 1
    t.integer "b_8_9", limit: 1
    t.integer "b_8_10", limit: 1
    t.integer "b_8_11", limit: 1
    t.integer "b_8_12", limit: 1
    t.integer "b_8_13", limit: 1
    t.integer "b_8_14", limit: 1
    t.integer "b_8_15", limit: 1
    t.integer "b_8_16", limit: 1
    t.integer "b_9_99", limit: 1
    t.integer "b_9_0", limit: 1
    t.integer "b_9_1", limit: 1
    t.integer "b_9_2", limit: 1
    t.integer "b_9_3", limit: 1
    t.integer "b_9_4", limit: 1
    t.integer "b_9_5", limit: 1
    t.integer "b_9_6", limit: 1
    t.integer "b_9_7", limit: 1
    t.integer "b_9_8", limit: 1
    t.integer "b_9_9", limit: 1
    t.integer "b_9_10", limit: 1
    t.integer "b_9_11", limit: 1
    t.integer "b_9_12", limit: 1
    t.integer "b_9_13", limit: 1
    t.integer "b_9_14", limit: 1
    t.integer "b_9_15", limit: 1
    t.integer "b_9_16", limit: 1
    t.integer "b_10_99", limit: 1
    t.integer "b_10_0", limit: 1
    t.integer "b_10_1", limit: 1
    t.integer "b_10_2", limit: 1
    t.integer "b_10_3", limit: 1
    t.integer "b_10_4", limit: 1
    t.integer "b_10_5", limit: 1
    t.integer "b_10_6", limit: 1
    t.integer "b_10_7", limit: 1
    t.integer "b_10_8", limit: 1
    t.integer "b_10_9", limit: 1
    t.integer "b_10_10", limit: 1
    t.integer "b_10_11", limit: 1
    t.integer "b_10_12", limit: 1
    t.integer "b_10_13", limit: 1
    t.integer "b_10_14", limit: 1
    t.integer "b_10_15", limit: 1
    t.integer "b_10_16", limit: 1
    t.integer "b_11_99", limit: 1
    t.integer "b_11_0", limit: 1
    t.integer "b_11_1", limit: 1
    t.integer "b_11_2", limit: 1
    t.integer "b_11_3", limit: 1
    t.integer "b_11_4", limit: 1
    t.integer "b_11_5", limit: 1
    t.integer "b_11_6", limit: 1
    t.integer "b_11_7", limit: 1
    t.integer "b_11_8", limit: 1
    t.integer "b_11_9", limit: 1
    t.integer "b_11_10", limit: 1
    t.integer "b_11_11", limit: 1
    t.integer "b_11_12", limit: 1
    t.integer "b_11_13", limit: 1
    t.integer "b_11_14", limit: 1
    t.integer "b_11_15", limit: 1
    t.integer "b_11_16", limit: 1
    t.integer "b_12_99", limit: 1
    t.integer "b_12_0", limit: 1
    t.integer "b_12_1", limit: 1
    t.integer "b_12_2", limit: 1
    t.integer "b_12_3", limit: 1
    t.integer "b_12_4", limit: 1
    t.integer "b_12_5", limit: 1
    t.integer "b_12_6", limit: 1
    t.integer "b_12_7", limit: 1
    t.integer "b_12_8", limit: 1
    t.integer "b_12_9", limit: 1
    t.integer "b_12_10", limit: 1
    t.integer "b_12_11", limit: 1
    t.integer "b_12_12", limit: 1
    t.integer "b_12_13", limit: 1
    t.integer "b_12_14", limit: 1
    t.integer "b_12_15", limit: 1
    t.integer "b_12_16", limit: 1
    t.integer "b_13_99", limit: 1
    t.integer "b_13_0", limit: 1
    t.integer "b_13_1", limit: 1
    t.integer "b_13_2", limit: 1
    t.integer "b_13_3", limit: 1
    t.integer "b_13_4", limit: 1
    t.integer "b_13_5", limit: 1
    t.integer "b_13_6", limit: 1
    t.integer "b_13_7", limit: 1
    t.integer "b_13_8", limit: 1
    t.integer "b_13_9", limit: 1
    t.integer "b_13_10", limit: 1
    t.integer "b_13_11", limit: 1
    t.integer "b_13_12", limit: 1
    t.integer "b_13_13", limit: 1
    t.integer "b_13_14", limit: 1
    t.integer "b_13_15", limit: 1
    t.integer "b_13_16", limit: 1
    t.integer "b_14_99", limit: 1
    t.integer "b_14_0", limit: 1
    t.integer "b_14_1", limit: 1
    t.integer "b_14_2", limit: 1
    t.integer "b_14_3", limit: 1
    t.integer "b_14_4", limit: 1
    t.integer "b_14_5", limit: 1
    t.integer "b_14_6", limit: 1
    t.integer "b_14_7", limit: 1
    t.integer "b_14_8", limit: 1
    t.integer "b_14_9", limit: 1
    t.integer "b_14_10", limit: 1
    t.integer "b_14_11", limit: 1
    t.integer "b_14_12", limit: 1
    t.integer "b_14_13", limit: 1
    t.integer "b_14_14", limit: 1
    t.integer "b_14_15", limit: 1
    t.integer "b_14_16", limit: 1
    t.integer "b_15_99", limit: 1
    t.integer "b_15_0", limit: 1
    t.integer "b_15_1", limit: 1
    t.integer "b_15_2", limit: 1
    t.integer "b_15_3", limit: 1
    t.integer "b_15_4", limit: 1
    t.integer "b_15_5", limit: 1
    t.integer "b_15_6", limit: 1
    t.integer "b_15_7", limit: 1
    t.integer "b_15_8", limit: 1
    t.integer "b_15_9", limit: 1
    t.integer "b_15_10", limit: 1
    t.integer "b_15_11", limit: 1
    t.integer "b_15_12", limit: 1
    t.integer "b_15_13", limit: 1
    t.integer "b_15_14", limit: 1
    t.integer "b_15_15", limit: 1
    t.integer "b_15_16", limit: 1
    t.integer "b_16_99", limit: 1
    t.integer "b_16_0", limit: 1
    t.integer "b_16_1", limit: 1
    t.integer "b_16_2", limit: 1
    t.integer "b_16_3", limit: 1
    t.integer "b_16_4", limit: 1
    t.integer "b_16_5", limit: 1
    t.integer "b_16_6", limit: 1
    t.integer "b_16_7", limit: 1
    t.integer "b_16_8", limit: 1
    t.integer "b_16_9", limit: 1
    t.integer "b_16_10", limit: 1
    t.integer "b_16_11", limit: 1
    t.integer "b_16_12", limit: 1
    t.integer "b_16_13", limit: 1
    t.integer "b_16_14", limit: 1
    t.integer "b_16_15", limit: 1
    t.integer "b_16_16", limit: 1
    t.integer "b_17_99", limit: 1
    t.integer "b_17_0", limit: 1
    t.integer "b_17_1", limit: 1
    t.integer "b_17_2", limit: 1
    t.integer "b_17_3", limit: 1
    t.integer "b_17_4", limit: 1
    t.integer "b_17_5", limit: 1
    t.integer "b_17_6", limit: 1
    t.integer "b_17_7", limit: 1
    t.integer "b_17_8", limit: 1
    t.integer "b_17_9", limit: 1
    t.integer "b_17_10", limit: 1
    t.integer "b_17_11", limit: 1
    t.integer "b_17_12", limit: 1
    t.integer "b_17_13", limit: 1
    t.integer "b_17_14", limit: 1
    t.integer "b_17_15", limit: 1
    t.integer "b_17_16", limit: 1
    t.integer "b_18_99", limit: 1
    t.integer "b_18_0", limit: 1
    t.integer "b_18_1", limit: 1
    t.integer "b_18_2", limit: 1
    t.integer "b_18_3", limit: 1
    t.integer "b_18_4", limit: 1
    t.integer "b_18_5", limit: 1
    t.integer "b_18_6", limit: 1
    t.integer "b_18_7", limit: 1
    t.integer "b_18_8", limit: 1
    t.integer "b_18_9", limit: 1
    t.integer "b_18_10", limit: 1
    t.integer "b_18_11", limit: 1
    t.integer "b_18_12", limit: 1
    t.integer "b_18_13", limit: 1
    t.integer "b_18_14", limit: 1
    t.integer "b_18_15", limit: 1
    t.integer "b_18_16", limit: 1
    t.integer "b_19_99", limit: 1
    t.integer "b_19_0", limit: 1
    t.integer "b_19_1", limit: 1
    t.integer "b_19_2", limit: 1
    t.integer "b_19_3", limit: 1
    t.integer "b_19_4", limit: 1
    t.integer "b_19_5", limit: 1
    t.integer "b_19_6", limit: 1
    t.integer "b_19_7", limit: 1
    t.integer "b_19_8", limit: 1
    t.integer "b_19_9", limit: 1
    t.integer "b_19_10", limit: 1
    t.integer "b_19_11", limit: 1
    t.integer "b_19_12", limit: 1
    t.integer "b_19_13", limit: 1
    t.integer "b_19_14", limit: 1
    t.integer "b_19_15", limit: 1
    t.integer "b_19_16", limit: 1
    t.integer "b_20_99", limit: 1
    t.integer "b_20_0", limit: 1
    t.integer "b_20_1", limit: 1
    t.integer "b_20_2", limit: 1
    t.integer "b_20_3", limit: 1
    t.integer "b_20_4", limit: 1
    t.integer "b_20_5", limit: 1
    t.integer "b_20_6", limit: 1
    t.integer "b_20_7", limit: 1
    t.integer "b_20_8", limit: 1
    t.integer "b_20_9", limit: 1
    t.integer "b_20_10", limit: 1
    t.integer "b_20_11", limit: 1
    t.integer "b_20_12", limit: 1
    t.integer "b_20_13", limit: 1
    t.integer "b_20_14", limit: 1
    t.integer "b_20_15", limit: 1
    t.integer "b_20_16", limit: 1
    t.index ["department_id"], name: "index_department_questionnaires_on_department_id"
    t.index ["study_iteration_id"], name: "index_department_questionnaires_on_study_iteration_id"
  end

  create_table "departments", force: :cascade do |t|
    t.bigint "hospital_id", null: false
    t.string "name"
    t.integer "patient_counter"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hospital_id", "name"], name: "index_departments_on_hospital_id_and_name", unique: true
    t.index ["hospital_id"], name: "index_departments_on_hospital_id"
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "department_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id", null: false
    t.bigint "address_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "acceptance_state", default: 0
    t.integer "user_id"
    t.index ["address_id"], name: "index_hospitals_on_address_id"
    t.index ["country_id"], name: "index_hospitals_on_country_id"
    t.index ["discarded_at"], name: "index_hospitals_on_discarded_at"
    t.index ["name"], name: "index_hospitals_on_name"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patient_identifications", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.integer "birth_year"
    t.integer "sex"
    t.boolean "pregnancy", default: false
    t.date "admission_date"
    t.boolean "evidence_infection", default: false
    t.integer "admission_infection"
    t.integer "infection_type"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_patient_identifications_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.integer "patient_type"
    t.string "initial"
    t.integer "department_id", null: false
    t.integer "creator_id", null: false
    t.integer "study_iteration_id", null: false
    t.datetime "discarded_at"
    t.integer "identification_state", default: 0
    t.integer "uti_state", default: 0
    t.integer "ssi_state", default: 0
    t.integer "biopsy_state", default: 0
    t.integer "biopsy_outcome_state", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "locked", default: false
    t.index ["creator_id"], name: "index_patients_on_creator_id"
    t.index ["department_id"], name: "index_patients_on_department_id"
    t.index ["study_iteration_id"], name: "index_patients_on_study_iteration_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "study_iterations", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id", null: false
    t.integer "acceptance_state", default: 0
    t.string "rejection_reason"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "exportable", default: false
    t.datetime "requested_export_permission_at"
    t.text "revokation_reason"
    t.index ["country_id"], name: "index_study_iterations_on_country_id"
    t.index ["discarded_at"], name: "index_study_iterations_on_discarded_at"
  end

  create_table "study_ranges", force: :cascade do |t|
    t.date "start"
    t.date "end"
    t.text "comment"
    t.bigint "study_iteration_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["study_iteration_id"], name: "index_study_ranges_on_study_iteration_id"
  end

  create_table "support_requests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "support_type"
    t.string "custom_support_type"
    t.text "message"
    t.text "answer"
    t.string "email"
    t.integer "state", default: 0
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_support_requests_on_user_id"
  end

  create_table "susceptibility_tests", force: :cascade do |t|
    t.integer "appendix_culture_result_id", null: false
    t.bigint "pos_id"
    t.string "pathogen"
    t.string "pathogen_specify"
    t.integer "cfu"
    t.boolean "aminoglycosides", default: false
    t.boolean "aminoglycosides_amikacin", default: false
    t.integer "aminoglycosides_amikacin_s", limit: 2
    t.boolean "aminoglycosides_gentamicin", default: false
    t.integer "aminoglycosides_gentamicin_s", limit: 2
    t.boolean "aminoglycosides_netilmicin", default: false
    t.integer "aminoglycosides_netilmicin_s", limit: 2
    t.boolean "aminoglycosides_tobramicin", default: false
    t.integer "aminoglycosides_tobramicin_s", limit: 2
    t.boolean "carbapenem", default: false
    t.boolean "carbapenem_doripenem", default: false
    t.integer "carbapenem_doripenem_s", limit: 2
    t.boolean "carbapenem_ertapenem", default: false
    t.integer "carbapenem_ertapenem_s", limit: 2
    t.boolean "carbapenem_imipenem", default: false
    t.integer "carbapenem_imipenem_s", limit: 2
    t.boolean "cephalosporins", default: false
    t.boolean "cephalosporins_cefepime", default: false
    t.integer "cephalosporins_cefepime_s", limit: 2
    t.boolean "cephalosporins_cefotaxime", default: false
    t.integer "cephalosporins_cefotaxime_s", limit: 2
    t.boolean "cephalosporins_cefotetan", default: false
    t.integer "cephalosporins_cefotetan_s", limit: 2
    t.boolean "cephalosporins_cefoxitin", default: false
    t.integer "cephalosporins_cefoxitin_s", limit: 2
    t.boolean "cephalosporins_ceftaroline", default: false
    t.integer "cephalosporins_ceftaroline_s", limit: 2
    t.boolean "cephalosporins_ceftazidime", default: false
    t.integer "cephalosporins_ceftazidime_s", limit: 2
    t.boolean "cephalosporins_cefuroxime", default: false
    t.integer "cephalosporins_cefuroxime_s", limit: 2
    t.boolean "cephalosporins_cephazolin", default: false
    t.integer "cephalosporins_cephazolin_s", limit: 2
    t.boolean "clindamycin", default: false
    t.integer "clindamycin_s", limit: 2
    t.boolean "daptomycin", default: false
    t.integer "daptomycin_s", limit: 2
    t.boolean "erythromycin", default: false
    t.integer "erythromycin_s", limit: 2
    t.boolean "fluoroquinolones", default: false
    t.boolean "fluoroquinolones_ciprofloxacin", default: false
    t.integer "fluoroquinolones_ciprofloxacin_s", limit: 2
    t.boolean "fluoroquinolones_levofloxacin", default: false
    t.integer "fluoroquinolones_levofloxacin_s", limit: 2
    t.boolean "fluoroquinolones_moxifloxacin", default: false
    t.integer "fluoroquinolones_moxifloxacin_s", limit: 2
    t.boolean "fluoroquinolones_ofloxacin", default: false
    t.integer "fluoroquinolones_ofloxacin_s", limit: 2
    t.boolean "fosfomycin", default: false
    t.integer "fosfomycin_s", limit: 2
    t.boolean "fucidanes", default: false
    t.integer "fucidanes_s", limit: 2
    t.boolean "glycopeptides", default: false
    t.boolean "glycopeptides_teicoplanin", default: false
    t.integer "glycopeptides_teicoplanin_s", limit: 2
    t.boolean "glycopeptides_telavancin", default: false
    t.integer "glycopeptides_telavancin_s", limit: 2
    t.boolean "glycopeptides_vancomycin", default: false
    t.integer "glycopeptides_vancomycin_s", limit: 2
    t.boolean "linezolid", default: false
    t.integer "linezolid_s", limit: 2
    t.boolean "monobactams", default: false
    t.integer "monobactams_s", limit: 2
    t.boolean "nitrofurantoin", default: false
    t.integer "nitrofurantoin_s", limit: 2
    t.boolean "penicillins", default: false
    t.boolean "penicillins_ampicillin", default: false
    t.boolean "penicillins_ampicillin_bli", default: false
    t.integer "penicillins_ampicillin_bli_s", limit: 2
    t.integer "penicillins_ampicillin_s", limit: 2
    t.boolean "penicillins_oxacillin", default: false
    t.integer "penicillins_oxacillin_s", limit: 2
    t.boolean "penicillins_piperacillin", default: false
    t.boolean "penicillins_piperacillin_bli", default: false
    t.integer "penicillins_piperacillin_bli_s", limit: 2
    t.integer "penicillins_piperacillin_s", limit: 2
    t.boolean "penicillins_ticarcillin", default: false
    t.integer "penicillins_ticarcillin_s", limit: 2
    t.boolean "phenicols", default: false
    t.integer "phenicols_s", limit: 2
    t.boolean "polymixins", default: false
    t.boolean "polymixins_colistins", default: false
    t.integer "polymixins_colistins_s", limit: 2
    t.boolean "polymixins_polymixin", default: false
    t.integer "polymixins_polymixin_s", limit: 2
    t.boolean "rifampin", default: false
    t.integer "rifampin_s", limit: 2
    t.boolean "tetracyclines", default: false
    t.boolean "tetracyclines_doxycyclin", default: false
    t.integer "tetracyclines_doxycyclin_s", limit: 2
    t.boolean "tetracyclines_glycylcylines", default: false
    t.integer "tetracyclines_glycylcylines_s", limit: 2
    t.boolean "tetracyclines_minocycline", default: false
    t.integer "tetracyclines_minocycline_s", limit: 2
    t.boolean "tetracyclines_tetracycline", default: false
    t.integer "tetracyclines_tetracycline_s", limit: 2
    t.boolean "trimethoprim", default: false
    t.integer "trimethoprim_s", limit: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appendix_culture_result_id"], name: "index_susceptibility_tests_on_appendix_culture_result_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "title", default: "", null: false
    t.string "suffix", default: ""
    t.bigint "country_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "notifications_mask"
    t.string "keycloak_uid"
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["discarded_at"], name: "index_users_on_discarded_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "uti_ssi_histories", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_uti_ssi_histories_on_patient_id"
  end

  create_table "uti_ssi_questionnaires", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.datetime "discarded_at"
    t.integer "form_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "antimicrobial_treatment"
    t.index ["patient_id"], name: "index_uti_ssi_questionnaires_on_patient_id"
  end

  add_foreign_key "appendix_clinical_diagnoses", "uti_ssi_histories"
  add_foreign_key "appendix_urinary_tract_obstructions", "appendix_urological_risk_factors"
  add_foreign_key "appendix_urological_interventions", "uti_ssi_histories"
  add_foreign_key "appendix_urological_risk_factors", "uti_ssi_histories"
  add_foreign_key "biopsy_outcome_questionnaires", "patients"
  add_foreign_key "biopsy_questionnaires", "patients"
  add_foreign_key "department_questionnaires", "departments"
  add_foreign_key "department_questionnaires", "study_iterations"
  add_foreign_key "departments", "hospitals"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "users"
  add_foreign_key "hospitals", "addresses"
  add_foreign_key "hospitals", "countries"
  add_foreign_key "patient_identifications", "patients"
  add_foreign_key "patients", "departments"
  add_foreign_key "patients", "study_iterations"
  add_foreign_key "patients", "users", column: "creator_id"
  add_foreign_key "study_iterations", "countries"
  add_foreign_key "study_ranges", "study_iterations"
  add_foreign_key "support_requests", "users"
  add_foreign_key "susceptibility_tests", "appendix_culture_results"
  add_foreign_key "uti_ssi_histories", "patients"
  add_foreign_key "uti_ssi_questionnaires", "patients"
end
