class Admin::HospitalsController < ApplicationController
  include AdminAuthenticated
  include Admin::ResourcePage
  layout 'admin'
end
