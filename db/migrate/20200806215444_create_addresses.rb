class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :zip_code
      t.string :city
      #t.references :hospital
      t.datetime :discarded_at
      t.index :discarded_at

      t.timestamps
    end
  end
end
