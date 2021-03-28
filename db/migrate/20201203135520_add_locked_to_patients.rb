class AddLockedToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :locked, :boolean, default: false
  end
end
