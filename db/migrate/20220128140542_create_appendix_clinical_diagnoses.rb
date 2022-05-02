class CreateAppendixClinicalDiagnoses < ActiveRecord::Migration[6.1]
  def change
    create_table :appendix_clinical_diagnoses do |t|
      t.references :uti_ssi_history, null: false, foreign_key: true

      t.date :diagnosis_date_uti
      t.date :diagnosis_date_ssi

      t.string :diagnosis_uti, limit: 255
      t.string :diagnosis_ssi, limit: 255
      t.text :diagnosis_specify_uti
      t.text :diagnosis_specify_ssi

      t.boolean :cdc_uti_symptomatic_uti_and_bacteria, default: false
      t.boolean :cdc_uti_symptomatic_uti_and_other, default: false
      t.boolean :cdc_uti_asymptomatic_bact_cath, default: false
      t.boolean :cdc_uti_asymptomatic_bact_nocatch, default: false
      t.boolean :cdc_uti_other, default: false
      t.text :cdc_uti_other_specify

      t.boolean :cdc_ssi_superficial, default: false
      t.boolean :cdc_ssi_deep, default: false
      t.boolean :cdc_ssi_organ, default: false

      t.timestamps
    end
  end
end
