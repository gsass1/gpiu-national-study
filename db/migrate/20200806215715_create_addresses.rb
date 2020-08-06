class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :postal_code
      t.string :city
      t.references :hospital, null: false
      t.belongs_to :country, null: false, foreign_key: true
      t.datetime :discarded_at
      t.index :discarded_at

      t.timestamps
    end
  end
end
