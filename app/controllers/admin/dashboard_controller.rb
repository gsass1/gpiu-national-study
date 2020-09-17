class Admin::DashboardController < ApplicationController
  include AdminAuthenticated
  layout 'admin'

  def index
  end
end
