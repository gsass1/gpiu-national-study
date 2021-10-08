# frozen_string_literal: true

module RegionalAdmin
  class UsersController < ApplicationController
    include RegionalAdminAuthenticated
    include Admin::ResourcePage
    layout 'regional_admin'
  end
end
