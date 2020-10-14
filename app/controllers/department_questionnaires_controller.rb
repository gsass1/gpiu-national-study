class DepartmentQuestionnairesController < ApplicationController
  include ActiveStudyIteration
  include Authenticated
  load_and_authorize_resource

  requires_active_study_iteration only: [:update]

  def edit
    @department = @department_questionnaire.department
    @hospital = @department.hospital
  end
end
