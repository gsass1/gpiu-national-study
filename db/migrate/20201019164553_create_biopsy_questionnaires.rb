class CreateBiopsyQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :biopsy_questionnaires do |t|
      t.references :patient, null: false, foreign_key: true
      t.datetime :discarded_at

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

      t.timestamps
    end
  end
end
