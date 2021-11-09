# frozen_string_literal: true

module RegionalAdmin
  class DashboardController < ApplicationController
    include RegionalAdminAuthenticated

    layout 'regional_admin'

    def index
      add_breadcrumb 'Admin', regional_admin_country_dashboard_index_path(current_country.iso_2)

      @user_count = @country.users.count
      @hospitals_count = @country.hospitals.count
      @departments_count = @country.departments.count
      @study_iterations_count = @country.study_iterations.count
    end
  end
end
