# frozen_string_literal: true

module DashboardHelper
  def current_and_upcoming_study_iterations
    current_user.country.current_and_upcoming_study_iterations
  end
end

