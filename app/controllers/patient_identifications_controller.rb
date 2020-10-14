class PatientIdentificationsController < ApplicationController
  include Authenticated
  include ActiveStudyIteration

  load_and_authorize_resource
  requires_active_study_iteration only: [:update]

  add_breadcrumb I18n.t("application.nav.dashboard"), :dashboard_index_path
  add_breadcrumb I18n.t("patients.index.title"), :patients_path

  def edit
    add_breadcrumb I18n.t("patient_identifications.edit.title")
    @patient_identification.valid?
  end

  def update
    add_breadcrumb I18n.t("patient_identifications.edit.title")
    @patient_identification.update_attributes(patient_identification_params)
    if @patient_identification.save_with_errors
      flash[:success] = "Updated patient identification form"
    else
      flash[:danger] = "Failed to update form"
    end
    render :edit
  end

  private
  def patient_identification_params
    params.require(:patient_identification).permit(:birth_year, :sex, :pregnancy, :admission_date, :evidence_infection, :admission_infection, :infection_type)
  end
end
