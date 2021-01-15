class AddAcceptanceStateToHospitals < ActiveRecord::Migration[6.0]
  def change
    add_column :hospitals, :acceptance_state, :integer, default: 0
  end
end
