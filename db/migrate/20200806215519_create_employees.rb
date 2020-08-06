class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.references :hospital, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :discarded_at
      t.index :discarded_at

      t.timestamps
    end
  end
end
