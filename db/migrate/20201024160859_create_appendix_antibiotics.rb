class CreateAppendixAntibiotics < ActiveRecord::Migration[6.0]
  def change
    create_table :appendix_antibiotics do |t|
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
      t.timestamps
    end
  end
end
