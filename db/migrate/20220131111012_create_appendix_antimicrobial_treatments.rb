class CreateAppendixAntimicrobialTreatments < ActiveRecord::Migration[6.1]
  def change
    create_table :appendix_antimicrobial_treatments do |t|
      t.references :questionnaire, null: false, polymorphic: true

      t.string :treatment, limit: 255

      t.timestamps
    end
  end
end
