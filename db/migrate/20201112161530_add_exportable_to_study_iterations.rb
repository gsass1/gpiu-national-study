class AddExportableToStudyIterations < ActiveRecord::Migration[6.0]
  def change
    add_column :study_iterations, :exportable, :boolean, default: false
  end
end
