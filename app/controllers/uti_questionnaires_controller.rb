class UtiQuestionnairesController < ApplicationController
  include Authenticated
  include ActiveStudyIteration

  load_and_authorize_resource
  requires_active_study_iteration only: [:update]

  add_breadcrumb I18n.t("application.nav.dashboard"), :dashboard_index_path
  add_breadcrumb I18n.t("patients.index.title"), :patients_path

  before_action :add_breadcrumbs

  def edit
    @uti_questionnaire.valid?
  end

  def update
    @uti_questionnaire.update_attributes(uti_questionnaire_params)
    if @uti_questionnaire.save_with_errors
      flash[:success] = "Updated UTI form"
    else
      flash[:danger] = "Failed to update form"
    end
    render :edit
  end

  private
  def uti_questionnaire_params
    params.require(:uti_questionnaire).permit(:test)
  end

  def add_breadcrumbs
    add_breadcrumb I18n.t("uti_questionnaires.edit.title")
  end
end
