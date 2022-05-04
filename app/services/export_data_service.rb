# frozen_string_literal: true

class ExportDataService < BaseService
  attr_reader :study_iteration, :type_of_data

  def initialize(study_iteration, type_of_data)
    @study_iteration = study_iteration
    @type_of_data = type_of_data
  end

  def call
    case type_of_data
    when 'uti_ssi_patients'
      Patient.export(study_iteration.patients.uti_ssi)
    when 'prostate_biopsy_patients'
      Patient.export(study_iteration.patients.prostate_biopsy)
    when 'hospitals'
      Department.as_csv_collection(study_iteration.departments)
    end
  end

  def filename
    "#{study_iteration.name.to_param}-#{type_of_data}.csv"
  end
end
