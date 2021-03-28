class AddUserIdToHospitals < ActiveRecord::Migration[6.0]
  def change
    add_column :hospitals, :user_id, :integer
  end
end
