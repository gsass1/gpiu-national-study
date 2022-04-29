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

ActiveRecord::Schema.define(version: 2021_11_22_072343) do

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
    t.bigint "questionnaire_id"
    t.string "questionnaire_type", limit: 255
    t.bigint "pos_id"
    t.integer "aminoglycoside"
    t.integer "carbapenem"
    t.integer "first_generation_cephalosporin"
    t.integer "second_generation_cephalosporin"
    t.integer "third_generation_cephalosporin"
    t.integer "fourth_generation_cephalosporin"
    t.integer "fifth_generation_cephalosporin"
    t.integer "glycopeptide"
    t.integer "lincosamide"
    t.integer "macrolide"
    t.integer "monobactam"
    t.integer "nitrofuran"
    t.integer "penicillin"
    t.integer "polypeptide"
    t.integer "quinolone"
    t.integer "sulfonamide"
    t.integer "tetracycline"
    t.integer "antimycobacterial_drug"
    t.integer "other"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "appendix_comorbidities", force: :cascade do |t|
    t.integer "questionnaire_id"
    t.string "questionnaire_type", limit: 255
    t.integer "pos_id"
    t.boolean "myocardialinfarction"
    t.boolean "congestiveheartfailure"
    t.boolean "vasculardisease"
    t.boolean "cerebrovascular"
    t.boolean "dementia"
    t.boolean "pulmonary"
    t.boolean "tissuedisease"
    t.boolean "ulcerdisease"
    t.boolean "mildliver"
    t.boolean "diabetes"
    t.boolean "hemiplegia"
    t.boolean "renaldisease"
    t.boolean "diabetesorgandamage"
    t.boolean "tumor"
    t.boolean "leukaemia"
    t.boolean "lymphoma"
    t.boolean "severeliverdamage"
    t.boolean "metastatictumor"
    t.boolean "aids"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "appendix_culture_results", force: :cascade do |t|
    t.bigint "questionnaire_id"
    t.string "questionnaire_type", limit: 255
    t.bigint "pos_id"
    t.string "first_pathogen", limit: 255
    t.string "first_pathogen_specify", limit: 255
    t.bigint "first_pathogen_enter_cfu_ml"
    t.string "second_pathogen", limit: 255
    t.string "second_pathogen_specify", limit: 255
    t.bigint "second_pathogen_enter_cfu_ml"
    t.bigint "susceptibility_standard"
    t.string "susceptibility_standard_other_specify", limit: 255
    t.boolean "first_susceptibility_test_aminoglycosides"
    t.boolean "first_susceptibility_test_aminoglycosides_amikacin"
    t.integer "first_susceptibility_test_aminoglycosides_amikacin_s", limit: 2
    t.boolean "first_susceptibility_test_aminoglycosides_gentamicin"
    t.integer "first_susceptibility_test_aminoglycosides_gentamicin_s", limit: 2
    t.boolean "first_susceptibility_test_aminoglycosides_netilmicin"
    t.integer "first_susceptibility_test_aminoglycosides_netilmicin_s", limit: 2
    t.boolean "first_susceptibility_test_aminoglycosides_tobramicin"
    t.integer "first_susceptibility_test_aminoglycosides_tobramicin_s", limit: 2
    t.boolean "first_susceptibility_test_carbapenem"
    t.boolean "first_susceptibility_test_carbapenem_doripenem"
    t.integer "first_susceptibility_test_carbapenem_doripenem_s", limit: 2
    t.boolean "first_susceptibility_test_carbapenem_ertapenem"
    t.integer "first_susceptibility_test_carbapenem_ertapenem_s", limit: 2
    t.boolean "first_susceptibility_test_carbapenem_imipenem"
    t.integer "first_susceptibility_test_carbapenem_imipenem_s", limit: 2
    t.boolean "first_susceptibility_test_cephalosporins"
    t.boolean "first_susceptibility_test_cephalosporins_cefepime"
    t.integer "first_susceptibility_test_cephalosporins_cefepime_s", limit: 2
    t.boolean "first_susceptibility_test_cephalosporins_cefotaxime"
    t.integer "first_susceptibility_test_cephalosporins_cefotaxime_s", limit: 2
    t.boolean "first_susceptibility_test_cephalosporins_cefotetan"
    t.integer "first_susceptibility_test_cephalosporins_cefotetan_s", limit: 2
    t.boolean "first_susceptibility_test_cephalosporins_cefoxitin"
    t.integer "first_susceptibility_test_cephalosporins_cefoxitin_s", limit: 2
    t.boolean "first_susceptibility_test_cephalosporins_ceftaroline"
    t.integer "first_susceptibility_test_cephalosporins_ceftaroline_s", limit: 2
    t.boolean "first_susceptibility_test_cephalosporins_ceftazidime"
    t.integer "first_susceptibility_test_cephalosporins_ceftazidime_s", limit: 2
    t.boolean "first_susceptibility_test_cephalosporins_cefuroxime"
    t.integer "first_susceptibility_test_cephalosporins_cefuroxime_s", limit: 2
    t.boolean "first_susceptibility_test_cephalosporins_cephazolin"
    t.integer "first_susceptibility_test_cephalosporins_cephazolin_s", limit: 2
    t.boolean "first_susceptibility_test_clindamycin"
    t.integer "first_susceptibility_test_clindamycin_s", limit: 2
    t.boolean "first_susceptibility_test_daptomycin"
    t.integer "first_susceptibility_test_daptomycin_s", limit: 2
    t.boolean "first_susceptibility_test_erythromycin"
    t.integer "first_susceptibility_test_erythromycin_s", limit: 2
    t.boolean "first_susceptibility_test_fluoroquinolones"
    t.boolean "first_susceptibility_test_fluoroquinolones_ciprofloxacin"
    t.integer "first_susceptibility_test_fluoroquinolones_ciprofloxacin_s", limit: 2
    t.boolean "first_susceptibility_test_fluoroquinolones_levofloxacin"
    t.integer "first_susceptibility_test_fluoroquinolones_levofloxacin_s", limit: 2
    t.boolean "first_susceptibility_test_fluoroquinolones_moxifloxacin"
    t.integer "first_susceptibility_test_fluoroquinolones_moxifloxacin_s", limit: 2
    t.boolean "first_susceptibility_test_fluoroquinolones_ofloxacin"
    t.integer "first_susceptibility_test_fluoroquinolones_ofloxacin_s", limit: 2
    t.boolean "first_susceptibility_test_fosfomycin"
    t.integer "first_susceptibility_test_fosfomycin_s", limit: 2
    t.boolean "first_susceptibility_test_fucidanes"
    t.integer "first_susceptibility_test_fucidanes_s", limit: 2
    t.boolean "first_susceptibility_test_glycopeptides"
    t.boolean "first_susceptibility_test_glycopeptides_teicoplanin"
    t.integer "first_susceptibility_test_glycopeptides_teicoplanin_s", limit: 2
    t.boolean "first_susceptibility_test_glycopeptides_telavancin"
    t.integer "first_susceptibility_test_glycopeptides_telavancin_s", limit: 2
    t.boolean "first_susceptibility_test_glycopeptides_vancomycin"
    t.integer "first_susceptibility_test_glycopeptides_vancomycin_s", limit: 2
    t.boolean "first_susceptibility_test_linezolid"
    t.integer "first_susceptibility_test_linezolid_s", limit: 2
    t.boolean "first_susceptibility_test_monobactams"
    t.integer "first_susceptibility_test_monobactams_s", limit: 2
    t.boolean "first_susceptibility_test_nitrofurantoin"
    t.integer "first_susceptibility_test_nitrofurantoin_s", limit: 2
    t.boolean "first_susceptibility_test_penicillins"
    t.boolean "first_susceptibility_test_penicillins_ampicillin"
    t.boolean "first_susceptibility_test_penicillins_ampicillin_bli"
    t.integer "first_susceptibility_test_penicillins_ampicillin_bli_s", limit: 2
    t.integer "first_susceptibility_test_penicillins_ampicillin_s", limit: 2
    t.boolean "first_susceptibility_test_penicillins_oxacillin"
    t.integer "first_susceptibility_test_penicillins_oxacillin_s", limit: 2
    t.boolean "first_susceptibility_test_penicillins_piperacillin"
    t.boolean "first_susceptibility_test_penicillins_piperacillin_bli"
    t.integer "first_susceptibility_test_penicillins_piperacillin_bli_s", limit: 2
    t.integer "first_susceptibility_test_penicillins_piperacillin_s", limit: 2
    t.boolean "first_susceptibility_test_penicillins_ticarcillin"
    t.integer "first_susceptibility_test_penicillins_ticarcillin_s", limit: 2
    t.boolean "first_susceptibility_test_phenicols"
    t.integer "first_susceptibility_test_phenicols_s", limit: 2
    t.boolean "first_susceptibility_test_polymixins"
    t.boolean "first_susceptibility_test_polymixins_colistins"
    t.integer "first_susceptibility_test_polymixins_colistins_s", limit: 2
    t.boolean "first_susceptibility_test_polymixins_polymixin"
    t.integer "first_susceptibility_test_polymixins_polymixin_s", limit: 2
    t.boolean "first_susceptibility_test_rifampin"
    t.integer "first_susceptibility_test_rifampin_s", limit: 2
    t.boolean "first_susceptibility_test_tetracyclines"
    t.boolean "first_susceptibility_test_tetracyclines_doxycyclin"
    t.integer "first_susceptibility_test_tetracyclines_doxycyclin_s", limit: 2
    t.boolean "first_susceptibility_test_tetracyclines_glycylcylines"
    t.integer "first_susceptibility_test_tetracyclines_glycylcylines_s", limit: 2
    t.boolean "first_susceptibility_test_tetracyclines_minocycline"
    t.integer "first_susceptibility_test_tetracyclines_minocycline_s", limit: 2
    t.boolean "first_susceptibility_test_tetracyclines_tetracycline"
    t.integer "first_susceptibility_test_tetracyclines_tetracycline_s", limit: 2
    t.boolean "first_susceptibility_test_trimethoprim"
    t.integer "first_susceptibility_test_trimethoprim_s", limit: 2
    t.boolean "second_susceptibility_test_aminoglycosides"
    t.boolean "second_susceptibility_test_aminoglycosides_amikacin"
    t.integer "second_susceptibility_test_aminoglycosides_amikacin_s", limit: 2
    t.boolean "second_susceptibility_test_aminoglycosides_gentamicin"
    t.integer "second_susceptibility_test_aminoglycosides_gentamicin_s", limit: 2
    t.boolean "second_susceptibility_test_aminoglycosides_netilmicin"
    t.integer "second_susceptibility_test_aminoglycosides_netilmicin_s", limit: 2
    t.boolean "second_susceptibility_test_aminoglycosides_tobramicin"
    t.integer "second_susceptibility_test_aminoglycosides_tobramicin_s", limit: 2
    t.boolean "second_susceptibility_test_carbapenem"
    t.boolean "second_susceptibility_test_carbapenem_doripenem"
    t.integer "second_susceptibility_test_carbapenem_doripenem_s", limit: 2
    t.boolean "second_susceptibility_test_carbapenem_ertapenem"
    t.integer "second_susceptibility_test_carbapenem_ertapenem_s", limit: 2
    t.boolean "second_susceptibility_test_carbapenem_imipenem"
    t.integer "second_susceptibility_test_carbapenem_imipenem_s", limit: 2
    t.boolean "second_susceptibility_test_cephalosporins"
    t.boolean "second_susceptibility_test_cephalosporins_cefepime"
    t.integer "second_susceptibility_test_cephalosporins_cefepime_s", limit: 2
    t.boolean "second_susceptibility_test_cephalosporins_cefotaxime"
    t.integer "second_susceptibility_test_cephalosporins_cefotaxime_s", limit: 2
    t.boolean "second_susceptibility_test_cephalosporins_cefotetan"
    t.integer "second_susceptibility_test_cephalosporins_cefotetan_s", limit: 2
    t.boolean "second_susceptibility_test_cephalosporins_cefoxitin"
    t.integer "second_susceptibility_test_cephalosporins_cefoxitin_s", limit: 2
    t.boolean "second_susceptibility_test_cephalosporins_ceftaroline"
    t.integer "second_susceptibility_test_cephalosporins_ceftaroline_s", limit: 2
    t.boolean "second_susceptibility_test_cephalosporins_ceftazidime"
    t.integer "second_susceptibility_test_cephalosporins_ceftazidime_s", limit: 2
    t.boolean "second_susceptibility_test_cephalosporins_cefuroxime"
    t.integer "second_susceptibility_test_cephalosporins_cefuroxime_s", limit: 2
    t.boolean "second_susceptibility_test_cephalosporins_cephazolin"
    t.integer "second_susceptibility_test_cephalosporins_cephazolin_s", limit: 2
    t.boolean "second_susceptibility_test_clindamycin"
    t.integer "second_susceptibility_test_clindamycin_s", limit: 2
    t.boolean "second_susceptibility_test_daptomycin"
    t.integer "second_susceptibility_test_daptomycin_s", limit: 2
    t.boolean "second_susceptibility_test_erythromycin"
    t.integer "second_susceptibility_test_erythromycin_s", limit: 2
    t.boolean "second_susceptibility_test_fluoroquinolones"
    t.boolean "second_susceptibility_test_fluoroquinolones_ciprofloxacin"
    t.integer "second_susceptibility_test_fluoroquinolones_ciprofloxacin_s", limit: 2
    t.boolean "second_susceptibility_test_fluoroquinolones_levofloxacin"
    t.integer "second_susceptibility_test_fluoroquinolones_levofloxacin_s", limit: 2
    t.boolean "second_susceptibility_test_fluoroquinolones_moxifloxacin"
    t.integer "second_susceptibility_test_fluoroquinolones_moxifloxacin_s", limit: 2
    t.boolean "second_susceptibility_test_fluoroquinolones_ofloxacin"
    t.integer "second_susceptibility_test_fluoroquinolones_ofloxacin_s", limit: 2
    t.boolean "second_susceptibility_test_fosfomycin"
    t.integer "second_susceptibility_test_fosfomycin_s", limit: 2
    t.boolean "second_susceptibility_test_fucidanes"
    t.integer "second_susceptibility_test_fucidanes_s", limit: 2
    t.boolean "second_susceptibility_test_glycopeptides"
    t.boolean "second_susceptibility_test_glycopeptides_teicoplanin"
    t.integer "second_susceptibility_test_glycopeptides_teicoplanin_s", limit: 2
    t.boolean "second_susceptibility_test_glycopeptides_telavancin"
    t.integer "second_susceptibility_test_glycopeptides_telavancin_s", limit: 2
    t.boolean "second_susceptibility_test_glycopeptides_vancomycin"
    t.integer "second_susceptibility_test_glycopeptides_vancomycin_s", limit: 2
    t.boolean "second_susceptibility_test_linezolid"
    t.integer "second_susceptibility_test_linezolid_s", limit: 2
    t.boolean "second_susceptibility_test_monobactams"
    t.integer "second_susceptibility_test_monobactams_s", limit: 2
    t.boolean "second_susceptibility_test_nitrofurantoin"
    t.integer "second_susceptibility_test_nitrofurantoin_s", limit: 2
    t.boolean "second_susceptibility_test_penicillins"
    t.boolean "second_susceptibility_test_penicillins_ampicillin"
    t.boolean "second_susceptibility_test_penicillins_ampicillin_bli"
    t.integer "second_susceptibility_test_penicillins_ampicillin_bli_s", limit: 2
    t.integer "second_susceptibility_test_penicillins_ampicillin_s", limit: 2
    t.boolean "second_susceptibility_test_penicillins_oxacillin"
    t.integer "second_susceptibility_test_penicillins_oxacillin_s", limit: 2
    t.boolean "second_susceptibility_test_penicillins_piperacillin"
    t.boolean "second_susceptibility_test_penicillins_piperacillin_bli"
    t.integer "second_susceptibility_test_penicillins_piperacillin_bli_s", limit: 2
    t.integer "second_susceptibility_test_penicillins_piperacillin_s", limit: 2
    t.boolean "second_susceptibility_test_penicillins_ticarcillin"
    t.integer "second_susceptibility_test_penicillins_ticarcillin_s", limit: 2
    t.boolean "second_susceptibility_test_phenicols"
    t.integer "second_susceptibility_test_phenicols_s", limit: 2
    t.boolean "second_susceptibility_test_polymixins"
    t.boolean "second_susceptibility_test_polymixins_colistins"
    t.integer "second_susceptibility_test_polymixins_colistins_s", limit: 2
    t.boolean "second_susceptibility_test_polymixins_polymixin"
    t.integer "second_susceptibility_test_polymixins_polymixin_s", limit: 2
    t.boolean "second_susceptibility_test_rifampin"
    t.integer "second_susceptibility_test_rifampin_s", limit: 2
    t.boolean "second_susceptibility_test_tetracyclines"
    t.boolean "second_susceptibility_test_tetracyclines_doxycyclin"
    t.integer "second_susceptibility_test_tetracyclines_doxycyclin_s", limit: 2
    t.boolean "second_susceptibility_test_tetracyclines_glycylcylines"
    t.integer "second_susceptibility_test_tetracyclines_glycylcylines_s", limit: 2
    t.boolean "second_susceptibility_test_tetracyclines_minocycline"
    t.integer "second_susceptibility_test_tetracyclines_minocycline_s", limit: 2
    t.boolean "second_susceptibility_test_tetracyclines_tetracycline"
    t.integer "second_susceptibility_test_tetracyclines_tetracycline_s", limit: 2
    t.boolean "second_susceptibility_test_trimethoprim"
    t.integer "second_susceptibility_test_trimethoprim_s", limit: 2
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.boolean "outcome_analysis_dysuria"
    t.boolean "outcome_analysis_frequency"
    t.boolean "outcome_analysis_urgency"
    t.boolean "outcome_analysis_prostate_pain"
    t.boolean "outcome_analysis_rigor"
    t.boolean "outcome_analysis_loin_pain"
    t.boolean "outcome_analysis_fever"
    t.integer "physician_visit"
    t.integer "physician_visit_care_clinician"
    t.integer "physician_visit_emergency_room"
    t.integer "physician_visit_admission_hospital"
    t.boolean "physician_visit_admission_hospital_urology"
    t.boolean "physician_visit_admission_hospital_internal_medicine"
    t.boolean "physician_visit_admission_hospital_intensive_care"
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
    t.boolean "perioperative"
    t.boolean "urinary"
    t.boolean "nautireports"
    t.boolean "pathogens"
    t.boolean "resistance"
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
    t.boolean "pregnancy"
    t.date "admission_date"
    t.boolean "evidence_infection"
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

  create_table "uti_ssi_questionnaires", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.datetime "discarded_at"
    t.integer "form_type"
    t.boolean "previous"
    t.boolean "tractobstruction"
    t.text "tractobjstructionspecify"
    t.boolean "urinarystones_calyceal"
    t.boolean "urinarystones_renalpelvic"
    t.boolean "urinarystones_ureteral"
    t.boolean "urinarystones_bladder"
    t.boolean "treatment"
    t.text "treatmentspecify"
    t.boolean "hospitalisation"
    t.boolean "catheter_urethral"
    t.boolean "catheter_suprapubic"
    t.boolean "catheter_ureteralstent"
    t.boolean "catheter_nephrostomy"
    t.boolean "catheter_others"
    t.bigint "catheterduration"
    t.string "intervention_endoscopic", limit: 255
    t.string "intervention_laparoscopic", limit: 255
    t.string "intervention_percutaneous", limit: 255
    t.string "intervention_opensurgery", limit: 255
    t.string "protatebiopsy", limit: 255
    t.text "trus_biopsy"
    t.string "intervention_others", limit: 255
    t.string "intervention_contamination", limit: 255
    t.date "diagnosedate"
    t.string "clinicaldiagnosis", limit: 255
    t.text "clinicaldiagnosisspecify"
    t.boolean "symptomaticutiandbacteriuria"
    t.boolean "symptomaticutiandother"
    t.boolean "asymptomaticbactcath"
    t.boolean "asymptomaticbactnocath"
    t.boolean "otheruti"
    t.boolean "superficialssi"
    t.boolean "deepssi"
    t.boolean "organssi"
    t.boolean "provennauti"
    t.boolean "culturetissue_urine"
    t.boolean "culturetissue_blood"
    t.boolean "culturetissue_fluidswab"
    t.boolean "culturetissue_other"
    t.text "culturetissue_specify"
    t.string "antibioticculture", limit: 7
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "antimicrobial_treatment"
    t.index ["patient_id"], name: "index_uti_ssi_questionnaires_on_patient_id"
  end

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
  add_foreign_key "uti_ssi_questionnaires", "patients"
end
