class CreateStudyIterations < ActiveRecord::Migration[6.0]
  def change
    create_table :study_iterations do |t|
      t.string :name
      t.references :country, null: false, foreign_key: true
      t.integer :acceptance_state, default: 0
      t.string :rejection_reason
      t.datetime :discarded_at
      t.index :discarded_at

      t.timestamps
    end
  end
end
