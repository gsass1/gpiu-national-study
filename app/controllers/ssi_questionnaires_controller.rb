# frozen_string_literal: true

class SsiQuestionnairesController < ApplicationController
  include Authenticated
  include ActiveStudyIteration
  include AppendixComorbidityParams
  include AppendixAntibioticParams
  include AppendixCultureResultParams
  include SsiQuestionnaireParams
  include UtiSsiHistoryParams

  before_action :load_patient, :load_ssi_questionnaire, :add_breadcrumbs

  load_and_authorize_resource
  skip_load_resource

  requires_active_study_iteration only: [:update]

  def edit
    @ssi_questionnaire.valid? unless @patient.ssi_state == 'missing'
  end

  def update
    @ssi_questionnaire.update(ssi_questionnaire_params)
    if @ssi_questionnaire.save_with_errors
      flash[:success] = 'Updated SSI form'
    else
      flash[:danger] = 'Failed to update form'
    end
    render :edit
  end

  private

  def load_patient
    @patient = Patient.find(params[:patient_id])
  end

  def load_ssi_questionnaire
    @ssi_questionnaire = SsiQuestionnaire.find_by(id: params[:id], patient_id: @patient.id)
  end

  def ssi_questionnaire_params
    params.require(:ssi_questionnaire).permit(ssi_questionnaire_permitted_params)
  end

  def add_breadcrumbs
    add_breadcrumb I18n.t('application.nav.dashboard'), :dashboard_index_path
    add_breadcrumb I18n.t('patients.index.title'), :patients_path
    add_breadcrumb I18n.t('ssi_questionnaires.edit.title')
  end
end
