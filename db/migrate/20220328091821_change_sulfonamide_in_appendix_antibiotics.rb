class ChangeSulfonamideInAppendixAntibiotics < ActiveRecord::Migration[6.1]
  def change
    remove_column :appendix_antibiotics, :sulfonamide, :integer
    add_column :appendix_antibiotics, :trimethoprim_sulfamethoxazole, :integer
  end
end
