class CreateUtiSsiQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :uti_ssi_questionnaires do |t|
      t.references :patient, null: false, foreign_key: true
      t.datetime :discarded_at

      t.integer "form_type"
      
      t.timestamps
    end
  end
end
