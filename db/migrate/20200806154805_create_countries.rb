class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :iso_2, :null => false
      t.string :iso_3, :null => false
      t.string :name

      t.timestamps

    end
    add_index :countries, [:iso_2, :iso_3, :name], :unique => true
  end
end
