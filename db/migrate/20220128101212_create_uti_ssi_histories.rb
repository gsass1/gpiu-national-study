class CreateUtiSsiHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :uti_ssi_histories do |t|
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
