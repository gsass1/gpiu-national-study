class CreateAppendixUrologicalInterventions < ActiveRecord::Migration[6.1]
  def change
    create_table :appendix_urological_interventions do |t|
      t.references :uti_ssi_history, null: false, foreign_key: true

      t.string :performed_uti, limit: 255
      t.string :performed_ssi, limit: 255

      t.boolean :intervention_endoscopic_uti, default: false
      t.integer :endoscopic_uti, default: 0
      t.text :endoscopic_specify_uti

      t.boolean :intervention_percutaneous_uti, default: false
      t.integer :percutaneous_uti, default: 0
      t.text :percutaneous_specify_uti

      t.boolean :intervention_laparoscopic_uti, default: false
      t.integer :laparoscopic_uti, default: 0
      t.text :laparoscopic_specify_uti

      t.boolean :intervention_open_surgery_uti, default: false
      t.integer :open_surgery_uti, default: 0
      t.text :open_surgery_specify_uti

      t.boolean :intervention_prostate_biopsy_uti, default: false
      t.integer :prostate_biopsy_uti, default: 0
      t.text :prostate_biopsy_specify_uti

      t.boolean :intervention_others_uti, default: false
      t.integer :others_uti, default: 0

      t.integer :contamination_uti


      t.boolean :intervention_endoscopic_ssi, default: false
      t.integer :endoscopic_ssi, default: 0
      t.text :endoscopic_specify_ssi

      t.boolean :intervention_percutaneous_ssi, default: false
      t.integer :percutaneous_ssi, default: 0
      t.text :percutaneous_specify_ssi

      t.boolean :intervention_laparoscopic_ssi, default: false
      t.integer :laparoscopic_ssi, default: 0
      t.text :laparoscopic_specify_ssi

      t.boolean :intervention_open_surgery_ssi, default: false
      t.integer :open_surgery_ssi, default: 0
      t.text :open_surgery_specify_ssi

      t.boolean :intervention_prostate_biopsy_ssi, default: false
      t.integer :prostate_biopsy_ssi, default: 0
      t.text :prostate_biopsy_specify_ssi

      t.boolean :intervention_others_ssi, default: false
      t.integer :others_ssi, default: 0

      t.integer :contamination_ssi

      t.timestamps
    end
  end
end
