class CreateAppendixCultureResults < ActiveRecord::Migration[6.0]
  def change
    create_table :appendix_culture_results do |t|
      t.bigint "questionnaire_id"
      t.string "questionnaire_type", limit: 255

      t.bigint "pos_id"

      t.bigint "susceptibility_standard"
      t.string "susceptibility_standard_other_specify", limit: 255
      
      t.datetime "discarded_at"

      t.timestamps
    end
  end
end
