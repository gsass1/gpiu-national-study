class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.belongs_to :country, null: false, foreign_key: true
      t.belongs_to :address, null: false, foreign_key: true
      t.datetime :discarded_at
      t.index :discarded_at

      t.timestamps
    end
  end
end
