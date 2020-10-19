class RenameBiopsyStateColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :patients, :prostate_biopsy_state, :biopsy_state
    rename_column :patients, :prostate_biopsy_outcome_state, :biopsy_outcome_state
  end
end
