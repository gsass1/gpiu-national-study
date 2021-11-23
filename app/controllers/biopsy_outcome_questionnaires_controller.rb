# frozen_string_literal: true

class BiopsyOutcomeQuestionnairesController < ApplicationController
  include Authenticated
  include ActiveStudyIteration
  include AppendixCultureResultParams
  include BiopsyOutcomeQuestionnaireParams

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
    params.require(:biopsy_outcome_questionnaire).permit(biopsy_outcome_questionnaire_permitted_params)
  end

  def add_breadcrumbs
    add_breadcrumb I18n.t('biopsy_outcome_questionnaires.edit.title')
  end
end
