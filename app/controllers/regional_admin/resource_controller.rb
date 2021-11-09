# frozen_string_literal: true

module RegionalAdmin
  class ResourceController < ApplicationController
    include RegionalAdminAuthenticated
    include Admin::ResourcePage
    layout 'regional_admin'

    helper_method :current_country
  end
end
