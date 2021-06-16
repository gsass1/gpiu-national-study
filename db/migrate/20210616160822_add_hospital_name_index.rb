class AddHospitalNameIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :hospitals, :name
  end
end
