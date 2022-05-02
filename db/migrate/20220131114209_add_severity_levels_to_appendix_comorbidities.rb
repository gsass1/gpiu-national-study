class AddSeverityLevelsToAppendixComorbidities < ActiveRecord::Migration[6.1]
  def change
    add_column :appendix_comorbidities, :severity_one, :boolean, default: false
    add_column :appendix_comorbidities, :severity_two, :boolean, default: false
    add_column :appendix_comorbidities, :severity_three, :boolean, default: false
    add_column :appendix_comorbidities, :severity_four, :boolean, default: false
  end
end
