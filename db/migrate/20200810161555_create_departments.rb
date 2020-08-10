class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.references :hospital, null: false, foreign_key: true
      t.string :name
      t.integer :patient_counter

      t.timestamps
    end
  end
end
