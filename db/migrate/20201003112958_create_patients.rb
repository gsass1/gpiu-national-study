class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.integer :type
      t.string :initial
      t.references :department, null: false, foreign_key: true
      t.references :creator, null: false, foreign_key: true
      t.references :study_iteration, null: false, foreign_key: true
      t.datetime :discarded_at
      t.integer :identification_state, default: 0
      t.integer :uti_state, default: 0
      t.integer :ssi_state, default: 0
      t.integer :prostate_biopsy_state, default: 0
      t.integer :prostate_biopsy_outcome_state, default: 0

      t.timestamps
    end
  end
end
