class AddRequestedExportPermissionAtToStudyIterations < ActiveRecord::Migration[6.1]
  def up
    add_column :study_iterations, :requested_export_permission_at, :datetime
  end

  def down
    remove_column :study_iterations, :requested_export_permission_at
  end
end
