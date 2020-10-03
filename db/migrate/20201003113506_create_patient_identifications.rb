class CreatePatientIdentifications < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_identifications do |t|
      t.references :patient, null: false, foreign_key: true
      t.integer :birth_year
      t.integer :sex
      t.boolean :pregnancy
      t.date :admission_date
      t.boolean :evidence_infection
      t.integer :admission_infection
      t.integer :infection_type
      t.datetime :discarded_at

      t.timestamps
    end
  end
end
