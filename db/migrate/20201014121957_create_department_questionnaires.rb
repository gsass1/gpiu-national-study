class CreateDepartmentQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :department_questionnaires do |t|
      t.references :department, nulll: false, foreign_key: true
      t.references :study_iteration, null: false, foreign_key: true

      t.integer :state, default: 0
      t.datetime :discarded_at

      t.timestamps

      # 2
      t.integer :hospital_beds
      t.integer :hospital_type
      t.string :hospital_othertype

      # 3
      t.integer :department_beds
      t.integer :department_admissions
      t.integer :department_stay
      t.integer :department_urinecultures

      # 4
      t.integer :patient_male
      t.integer :patient_female
      t.integer :patient_category1
      t.integer :patient_category2
      t.integer :patient_category3
      t.integer :patient_opensurgery
      t.integer :patient_endoscopic
      t.integer :patient_laparoscopic
      t.integer :patient_prostaticbiopsy
      t.integer :patient_transurethral_closed
      t.integer :patient_transurethral_open
      t.integer :patient_intermittent
      t.integer :patient_suprapubic
      t.integer :patient_nephrostromy
      t.integer :patient_ureteral
      t.integer :patient_provenuti
      t.integer :patient_suspecteduti
      t.integer :patient_otherinfections
      t.integer :patient_prophylaxis

      # 5
      t.boolean :perioperative
      t.boolean :urinary
      t.boolean :nautireports
      t.boolean :pathogens
      t.boolean :resistance

      # 6
      20.times do |i_group|
        t.integer "b_#{i_group+1}_99", limit: 1
        t.integer "b_#{i_group+1}_0", limit: 1

        16.times do |i_item|
          t.integer "b_#{i_group+1}_#{i_item+1}", limit: 1
        end
      end
    end
  end
end
