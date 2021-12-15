# frozen_string_literal: true

class UtiQuestionnairesController < ApplicationController
  include Authenticated
  include ActiveStudyIteration
  include AppendixComorbidityParams
  include AppendixAntibioticParams
  include AppendixCultureResultParams
  include UtiQuestionnaireParams

  before_action :load_patient, :load_uti_questionnaire

  load_and_authorize_resource
  skip_load_resource

  requires_active_study_iteration only: [:update]

  add_breadcrumb I18n.t('application.nav.dashboard'), :dashboard_index_path
  add_breadcrumb I18n.t('patients.index.title'), :patients_path

  before_action :add_breadcrumbs

  def edit
    @uti_questionnaire.valid?
  end

  def update
    @uti_questionnaire.update(uti_questionnaire_params)
    if @uti_questionnaire.save_with_errors
      flash[:success] = 'Updated UTI form'
    else
      flash[:danger] = 'Failed to update form'
    end
    render :edit
  end

  private

  def load_patient
    @patient = Patient.find(params[:patient_id])
  end

  def load_uti_questionnaire
    @uti_questionnaire = UtiQuestionnaire.find_by(id: params[:id], patient_id: @patient.id)
  end

  def uti_questionnaire_params
    params.require(:uti_questionnaire).permit(uti_questionnaire_permitted_params)
  end

  def add_breadcrumbs
    add_breadcrumb I18n.t('uti_questionnaires.edit.title')
  end
end
