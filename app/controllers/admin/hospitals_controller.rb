class Admin::HospitalsController < ApplicationController
  include AdminAuthenticated
  layout 'admin'

  def index
  end
end
