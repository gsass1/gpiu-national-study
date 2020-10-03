class PatientIdentificationsController < ApplicationController
  include Authenticated
  include ActiveStudyIteration

  load_and_authorize_resource
  requires_active_study_iteration

  add_breadcrumb I18n.t("application.nav.dashboard"), :dashboard_index_path
  add_breadcrumb I18n.t("patients.index.title"), :patients_path

  def edit
    add_breadcrumb I18n.t("patient_identifications.edit.title")
  end

  def update
    if @patient_identification.update_attributes(patient_identification_params)
      flash[:success] = "Updated patient identification form"
      redirect_to patients_path
    else
      render :edit
    end
  end

  private
  def patient_identification_params
    params.require(:patient_identification).permit(:birth_year, :sex, :pregnancy, :admission_date, :evidence_infection, :admission_infection, :infection_type)
  end
end
