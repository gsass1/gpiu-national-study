class CreateStudyRanges < ActiveRecord::Migration[6.0]
  def change
    create_table :study_ranges do |t|
      t.date :start
      t.date :end
      t.text :comment
      t.references :study_iteration, null: false, foreign_key: true

      t.timestamps
    end
  end
end
