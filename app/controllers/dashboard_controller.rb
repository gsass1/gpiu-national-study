class DashboardController < ApplicationController
  include Authenticated

  def index
    @study_iteration = current_user.country.next_or_current_study_iteration
    @active_range = @study_iteration.active_range
  end
end
