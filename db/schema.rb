# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_14_121957) do

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "zip_code"
    t.string "city"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discarded_at"], name: "index_addresses_on_discarded_at"
  end

  create_table "countries", force: :cascade do |t|
    t.string "iso_2", null: false
    t.string "iso_3", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["iso_2", "iso_3", "name"], name: "index_countries_on_iso_2_and_iso_3_and_name", unique: true
  end

  create_table "department_questionnaires", force: :cascade do |t|
    t.integer "department_id"
    t.integer "study_iteration_id", null: false
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
    t.integer "hospital_id", null: false
    t.string "name"
    t.integer "patient_counter"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hospital_id", "name"], name: "index_departments_on_hospital_id_and_name", unique: true
    t.index ["hospital_id"], name: "index_departments_on_hospital_id"
  end

  create_table "employees", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.integer "country_id", null: false
    t.integer "address_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_hospitals_on_address_id"
    t.index ["country_id"], name: "index_hospitals_on_country_id"
    t.index ["discarded_at"], name: "index_hospitals_on_discarded_at"
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
    t.integer "patient_id", null: false
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
    t.integer "prostate_biopsy_state", default: 0
    t.integer "prostate_biopsy_outcome_state", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_patients_on_creator_id"
    t.index ["department_id"], name: "index_patients_on_department_id"
    t.index ["study_iteration_id"], name: "index_patients_on_study_iteration_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "study_iterations", force: :cascade do |t|
    t.string "name"
    t.integer "country_id", null: false
    t.integer "acceptance_state"
    t.string "rejection_reason"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_study_iterations_on_country_id"
    t.index ["discarded_at"], name: "index_study_iterations_on_discarded_at"
  end

  create_table "study_ranges", force: :cascade do |t|
    t.date "start"
    t.date "end"
    t.text "comment"
    t.integer "study_iteration_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["study_iteration_id"], name: "index_study_ranges_on_study_iteration_id"
  end

  create_table "support_requests", force: :cascade do |t|
    t.integer "user_id", null: false
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
    t.integer "country_id"
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
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["discarded_at"], name: "index_users_on_discarded_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

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
end
