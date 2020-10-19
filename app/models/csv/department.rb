class Csv::Department < Csv::Writer
  def row(d)
    col 'ID', d.id

    col 'hospital_id', d.hospital_id
    col 'name', d.name
    col 'patients_count', d.patients.count

    unless d.current_department_questionnaire.nil?
      ::DepartmentQuestionnaire.column_names.each do |column|
        col "questionnaire.#{column}", d.current_department_questionnaire.read_attribute(column)
      end
    end
  end
end
