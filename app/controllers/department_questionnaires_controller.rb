class DepartmentQuestionnairesController < ApplicationController
  include ActiveStudyIteration
  include Authenticated
  load_and_authorize_resource

  add_breadcrumb I18n.t("application.nav.dashboard"), :dashboard_index_path
  add_breadcrumb I18n.t("patients.index.title"), :patients_path

  requires_active_study_iteration only: [:update]

  def edit
    add_breadcrumb I18n.t("department_questionnaires.edit.title")

    @department = @department_questionnaire.department
    @hospital = @department.hospital
  end
end
