class RegionalAdmin::HospitalsController < ApplicationController
  include RegionalAdminAuthenticated
  include Admin::ResourcePage
  layout 'regional_admin'
end
