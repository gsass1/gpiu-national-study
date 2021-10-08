# frozen_string_literal: true

class BiopsyQuestionnairesController < ApplicationController
  include Authenticated
  include ActiveStudyIteration
  include AppendixCultureResultParams

  load_and_authorize_resource
  skip_load_resource

  requires_active_study_iteration only: [:update]

  add_breadcrumb I18n.t('application.nav.dashboard'), :dashboard_index_path
  add_breadcrumb I18n.t('patients.index.title'), :patients_path

  before_action :load_patient, :load_biopsy_questionnaire, :add_breadcrumbs

  def edit
    @biopsy_questionnaire.valid?
  end

  def update
    @biopsy_questionnaire.update(biopsy_questionnaire_params)
    if @biopsy_questionnaire.save_with_errors
      flash[:success] = 'Updated biopsy form'
    else
      flash[:danger] = 'Failed to update form'
    end
    render :edit
  end

  private

  def load_patient
    @patient = Patient.find(params[:patient_id])
  end

  def load_biopsy_questionnaire
    @biopsy_questionnaire = BiopsyQuestionnaire.find_by(id: params[:id], patient_id: @patient.id)
  end

  def biopsy_questionnaire_params
    params.require(:biopsy_questionnaire).permit(:initial,
                                                 :age,
                                                 :antibiotics_preceding_months, :antibiotics_type, :antibiotics_dosage, :antibiotics_duration, :antibiotics_route,
                                                 :urogenital_infection_preceding_months,
                                                 :urinary_catheter, :urinary_catheter_duration,
                                                 :prostate_size_measured, :prostate_size,
                                                 :diabetes_mellitus,
                                                 :psa, :psa_size,
                                                 :repeated_biopsy, :repeated_biopsy_number_previous_procedures,
                                                 :preoperative_urine_examination, :preoperative_urine_examination_type, :preoperative_urine_culture_result,
                                                 :preoperative_bowel_preparation, :preoperative_bowel_preparation_type,
                                                 :antibiotic_prophylaxis, :antibiotic_prophylaxis_type, :antibiotic_prophylaxis_dosage, :antibiotic_prophylaxis_duration, :antibiotic_prophylaxis_route,
                                                 :biopsy_anesthesia, :biopsy_anesthesia_type,
                                                 :biopsy_route,
                                                 :number_cores_taken,
                                                 appendix_culture_result_attributes: appendix_culture_result_params)
  end

  def add_breadcrumbs
    add_breadcrumb I18n.t('biopsy_questionnaires.edit.title')
  end
end
