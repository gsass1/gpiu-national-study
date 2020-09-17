class Admin::UsersController < ApplicationController
  include AdminAuthenticated
  layout 'admin'

  def index
  end
end
