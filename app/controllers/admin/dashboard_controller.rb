class Admin::DashboardController < ApplicationController
  include AdminAuthenticated
  add_breadcrumb 'Admin', :admin_dashboard_index_path

  layout 'admin'

  def index; end
end
