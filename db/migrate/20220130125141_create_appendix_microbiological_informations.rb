class CreateAppendixMicrobiologicalInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :appendix_microbiological_informations do |t|
      t.references :questionnaire, null: false, polymorphic: true

      t.string :proven, limit: 255
      t.boolean :culture_tissue_urine, default: false
      t.boolean :culture_tissue_blood, default: false
      t.boolean :culture_tissue_swab, default: false
      t.boolean :culture_tissue_other, default: false
      t.text :culture_tissue_other_specify

      t.string :culture_antibiotics, limit: 255

      t.timestamps
    end
  end
end
