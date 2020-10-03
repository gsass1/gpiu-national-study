class Admin::SupportRequestsController < ApplicationController
  include AdminAuthenticated
  include Admin::ResourcePage
  layout 'admin'
end
