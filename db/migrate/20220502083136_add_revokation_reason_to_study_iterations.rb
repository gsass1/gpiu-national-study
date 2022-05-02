class AddRevokationReasonToStudyIterations < ActiveRecord::Migration[6.1]
  def change
    add_column :study_iterations, :revokation_reason, :text
  end
end
