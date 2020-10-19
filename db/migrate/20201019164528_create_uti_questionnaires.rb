class CreateUtiQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :uti_questionnaires do |t|
      t.references :patient, null: false, foreign_key: true
      t.integer :test
      t.datetime :discarded_at

      t.timestamps
    end
  end
end
