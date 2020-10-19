class SsiQuestionnairesController < ApplicationController
  include Authenticated
  include ActiveStudyIteration

  load_and_authorize_resource
  requires_active_study_iteration only: [:update]

  add_breadcrumb I18n.t("application.nav.dashboard"), :dashboard_index_path
  add_breadcrumb I18n.t("patients.index.title"), :patients_path

  before_action :add_breadcrumbs

  def edit
    @ssi_questionnaire.valid?
  end

  def update
    @ssi_questionnaire.update_attributes(ssi_questionnaire_params)
    if @ssi_questionnaire.save_with_errors
      flash[:success] = "Updated SSI form"
    else
      flash[:danger] = "Failed to update form"
    end
    render :edit
  end

  private
  def ssi_questionnaire_params
    params.require(:ssi_questionnaire).permit(:test)
  end

  def add_breadcrumbs
    add_breadcrumb I18n.t("ssi_questionnaires.edit.title")
  end
end