class CreateAppendixComorbidities < ActiveRecord::Migration[6.0]
  def change
    create_table :appendix_comorbidities do |t|
      t.integer "questionnaire_id"
      t.string "questionnaire_type", limit: 255

      t.integer "pos_id"

      t.boolean :myocardialinfarction, default: false
      t.boolean :congestiveheartfailure, default: false
      t.boolean :vasculardisease, default: false
      t.boolean :cerebrovascular, default: false
      t.boolean :dementia, default: false
      t.boolean :pulmonary, default: false
      t.boolean :tissuedisease, default: false
      t.boolean :ulcerdisease, default: false
      t.boolean :mildliver, default: false
      t.boolean :diabetes, default: false
      t.boolean :hemiplegia, default: false
      t.boolean :renaldisease, default: false
      t.boolean :diabetesorgandamage, default: false
      t.boolean :tumor, default: false
      t.boolean :leukaemia, default: false
      t.boolean :lymphoma, default: false
      t.boolean :severeliverdamage, default: false
      t.boolean :metastatictumor, default: false
      t.boolean :aids, default: false

      t.datetime "discarded_at"

      t.timestamps
    end
  end
end
