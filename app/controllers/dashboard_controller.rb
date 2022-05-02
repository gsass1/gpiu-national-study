# frozen_string_literal: true

class DashboardController < ApplicationController
  include Authenticated
  include ActiveStudyIteration

  def index
    patients = current_user.current_patients
    if patients.any?
      valid_patients = patients.includes(:patient_identification).locked.select(&:questionnaires_valid?)
    else
      valid_patients = []
    end

    @patients_count = patients.count
    @valid_patients_count = valid_patients.count
    @invalid_patients_count = patients.count - @valid_patients_count

    if patients.count.positive?
      @patient_progress = (@valid_patients_count.to_f / patients.count * 100.0).floor
    end

    @departments = current_user.departments.includes(:hospital)
  end
end
