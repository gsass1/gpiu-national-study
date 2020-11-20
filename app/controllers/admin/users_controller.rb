class Admin::UsersController < ApplicationController
  include AdminAuthenticated
  include Admin::ResourcePage
  layout 'admin'
end
