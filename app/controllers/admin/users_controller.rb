# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    include AdminAuthenticated
    include Admin::ResourcePage
    layout 'admin'
  end
end
