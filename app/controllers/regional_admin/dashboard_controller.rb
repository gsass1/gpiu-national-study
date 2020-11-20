class RegionalAdmin::DashboardController < ApplicationController
  include RegionalAdminAuthenticated

  layout 'regional_admin'

  def index
    add_breadcrumb "Admin", regional_admin_country_dashboard_index_path(current_country.iso_2)
  end
end
