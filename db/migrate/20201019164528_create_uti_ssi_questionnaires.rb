class CreateUtiSsiQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :uti_ssi_questionnaires do |t|
      t.references :patient, null: false, foreign_key: true
      t.datetime :discarded_at

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

      # NOTE(gian): these could be made into enums but I doubt it's worth the effort...
      t.string "intervention_endoscopic", limit: 255
      t.string "intervention_laparoscopic", limit: 255
      t.string "intervention_percutaneous", limit: 255
      t.string "intervention_opensurgery", limit: 255

      # UTI only
      t.string "protatebiopsy", limit: 255 # transrectal or perineal

      # SSI only
      t.text "trus_biopsy"

      # Same here with enums
      t.string "intervention_others", limit: 255
      t.string "intervention_contamination", limit: 255

      t.date "diagnosedate"

      t.string "clinicaldiagnosis", limit: 255
      t.text "clinicaldiagnosisspecify"

      # -- UTI only
      t.boolean "symptomaticutiandbacteriuria"
      t.boolean "symptomaticutiandother"

      t.boolean "asymptomaticbactcath"
      t.boolean "asymptomaticbactnocath"
      t.boolean "otheruti"
      # --

      # -- SSI only
      t.boolean "superficialssi"
      t.boolean "deepssi"
      t.boolean "organssi"
      # --

      t.boolean "provennauti"
      t.boolean "culturetissue_urine"
      t.boolean "culturetissue_blood"
      t.boolean "culturetissue_fluidswab"
      t.boolean "culturetissue_other"
      t.text "culturetissue_specify"

      t.string "antibioticculture", limit: 7

      t.timestamps
    end
  end
end
