# frozen_string_literal: true

class BiopsyOutcomeQuestionnairesController < ApplicationController
  include Authenticated
  include ActiveStudyIteration
  include AppendixCultureResultParams

  load_and_authorize_resource
  skip_load_resource

  requires_active_study_iteration only: [:update]

  add_breadcrumb I18n.t('application.nav.dashboard'), :dashboard_index_path
  add_breadcrumb I18n.t('patients.index.title'), :patients_path

  before_action :load_patient, :load_biopsy_outcome_questionnaire, :add_breadcrumbs

  before_action :add_breadcrumbs

  def edit
    @biopsy_outcome_questionnaire.valid?
  end

  def update
    @biopsy_outcome_questionnaire.update(biopsy_outcome_questionnaire_params)
    if @biopsy_outcome_questionnaire.save_with_errors
      flash[:success] = 'Updated Biopsy Outcome form'
    else
      flash[:danger] = 'Failed to update form'
    end
    render :edit
  end

  private

  def load_patient
    @patient = Patient.find(params[:patient_id])
  end

  def load_biopsy_outcome_questionnaire
    @biopsy_outcome_questionnaire = BiopsyOutcomeQuestionnaire.find_by(id: params[:id], patient_id: @patient.id)
  end

  def biopsy_outcome_questionnaire_params
    params.require(:biopsy_outcome_questionnaire).permit(
      :histopathology_analysis,
      :histopathology_biopsy_material_change,
      :histopathology_biopsy_material_change_severity,
      :outcome_analysis,
      :outcome_analysis_form_control_visit,
      :outcome_analysis_urinary_tract_infection, :outcome_analysis_dysuria, :outcome_analysis_frequency, :outcome_analysis_urgency, :outcome_analysis_prostate_pain, :outcome_analysis_rigor, :outcome_analysis_loin_pain, :outcome_analysis_fever,
      :physician_visit,
      :physician_visit_care_clinician,
      :physician_visit_emergency_room,
      :physician_visit_admission_hospital, :physician_visit_admission_hospital_urology, :physician_visit_admission_hospital_internal_medicine, :physician_visit_admission_hospital_intensive_care,
      :physician_visit_psa, :physician_visit_psa_value,
      :physician_visit_wbc_count, :physician_visit_wbc_value,
      :physician_visit_crp, :physician_visit_crp_value,
      :physician_visit_urine_culture, :physician_visit_urine_culture_result,
      :antibiotic_treatment, :antibiotics_type, :antibiotics_dosage, :antibiotics_duration, :antibiotics_route,
      :outcome,
      appendix_culture_result_attributes: appendix_culture_result_params
    )
  end

  def add_breadcrumbs
    add_breadcrumb I18n.t('biopsy_outcome_questionnaires.edit.title')
  end
end
