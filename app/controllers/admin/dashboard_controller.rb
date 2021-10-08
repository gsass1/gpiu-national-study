# frozen_string_literal: true

module Admin
  class DashboardController < ApplicationController
    include AdminAuthenticated
    add_breadcrumb 'Admin', :admin_dashboard_index_path

    layout 'admin'

    def index; end
  end
end
