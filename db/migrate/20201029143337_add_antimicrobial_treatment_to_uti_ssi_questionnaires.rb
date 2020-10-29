class AddAntimicrobialTreatmentToUtiSsiQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    add_column :uti_ssi_questionnaires, :antimicrobial_treatment, :integer
  end
end
