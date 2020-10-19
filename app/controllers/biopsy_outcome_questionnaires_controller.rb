class BiopsyOutcomeQuestionnairesController < ApplicationController
  include Authenticated
  include ActiveStudyIteration

  load_and_authorize_resource
  requires_active_study_iteration only: [:update]

  add_breadcrumb I18n.t("application.nav.dashboard"), :dashboard_index_path
  add_breadcrumb I18n.t("patients.index.title"), :patients_path

  before_action :add_breadcrumbs

  def edit
    @biopsy_outcome_questionnaire.valid?
  end

  def update
    @biopsy_outcome_questionnaire.update_attributes(biopsy_outcome_questionnaire_params)
    if @biopsy_outcome_questionnaire.save_with_errors
      flash[:success] = "Updated biopsy_outcome form"
    else
      flash[:danger] = "Failed to update form"
    end
    render :edit
  end

  private
  def biopsy_outcome_questionnaire_params
    params.require(:biopsy_outcome_questionnaire).permit(:test)
  end

  def add_breadcrumbs
    add_breadcrumb I18n.t("biopsy_outcome_questionnaires.edit.title")
  end
end
