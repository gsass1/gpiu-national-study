class ChangeCephalosporinGrouping < ActiveRecord::Migration[6.1]
  def change
    add_column :appendix_antibiotics, :cephalosporin, :integer

    remove_column :appendix_antibiotics, :first_generation_cephalosporin, :boolean
    remove_column :appendix_antibiotics, :second_generation_cephalosporin, :boolean
    remove_column :appendix_antibiotics, :third_generation_cephalosporin, :boolean
    remove_column :appendix_antibiotics, :fourth_generation_cephalosporin, :boolean
    remove_column :appendix_antibiotics, :fifth_generation_cephalosporin, :boolean
  end
end
