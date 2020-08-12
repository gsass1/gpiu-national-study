class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.datetime :discarded_at
      t.index :discarded_at

      t.timestamps
    end
  end
end
