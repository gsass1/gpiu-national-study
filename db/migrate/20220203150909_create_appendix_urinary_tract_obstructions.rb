class CreateAppendixUrinaryTractObstructions < ActiveRecord::Migration[6.1]
  def change
    create_table :appendix_urinary_tract_obstructions do |t|
      t.references :appendix_urological_risk_factor, null: false, foreign_key: true, index: { name: 'index_tract_obstructions_on_urological_risk_factors' }
      t.boolean :lower, default: false
      t.boolean :middle, default: false
      t.boolean :upper, default: false
      t.boolean :ureteropelvic_junction, default: false

      t.integer :pos_id, null: false

      t.timestamps
    end
  end
end
