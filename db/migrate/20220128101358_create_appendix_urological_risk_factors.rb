class CreateAppendixUrologicalRiskFactors < ActiveRecord::Migration[6.1]
  def change
    create_table :appendix_urological_risk_factors do |t|
      t.references :uti_ssi_history, null: false, foreign_key: true

      t.boolean :previous
      t.boolean :tract_obstruction

      t.boolean :tract_obstruction_left, default: false
      t.boolean :tract_obstruction_right, default: false
      t.boolean :bladder_outlet_obstruction, default: false

      t.string :urinarystones, limit: 255
      t.boolean :urinarystones_calyceal, default: false
      t.boolean :urinarystones_renalpelvic, default: false
      t.boolean :urinarystones_ureteral, default: false
      t.boolean :urinarystones_bladder, default: false

      t.string :antibiotic_treatment, limit: 255
      t.string :antibiotic_treatment_type, limit: 255
      t.text :antibiotic_treatment_specify

      t.boolean :hospitalisation
      t.text :hospitalisation_specify

      t.string :catheter, limit: 255
      t.boolean :catheter_urethral, default: false
      t.boolean :catheter_suprapubic, default: false
      t.boolean :catheter_ureteralstent, default: false
      t.boolean :catheter_nephrostomy, default: false
      t.boolean :catheter_others, default: false
      t.string :catheter_other_specify
      t.integer :catheterduration

      t.timestamps
    end
  end
end
