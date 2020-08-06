class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.references :address, null: false, foreign_key: true
      t.datetime :discarded_at
      t.index :discarded_at

      t.timestamps
    end
  end
end
