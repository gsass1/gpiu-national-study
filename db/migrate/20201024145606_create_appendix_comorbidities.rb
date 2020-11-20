class CreateAppendixComorbidities < ActiveRecord::Migration[6.0]
  def change
    create_table :appendix_comorbidities do |t|
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

      t.timestamps
    end
  end
end
