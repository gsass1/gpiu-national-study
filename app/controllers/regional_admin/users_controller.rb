class RegionalAdmin::UsersController < ApplicationController
  include RegionalAdminAuthenticated
  include Admin::ResourcePage
  layout 'regional_admin'
end
