class PatientsController < ApplicationController
  include Authenticated

  add_breadcrumb I18n.t("application.nav.dashboard"), :dashboard_index_path
  add_breadcrumb I18n.t("patients.index.title"), :patients_path

  before_action :load_study_iteration, only: [:index, :new]

  private
  def load_study_iteration
    @study_iteration = current_user.country.next_or_current_study_iteration
    @active_range = @study_iteration.active_range
  end
end
