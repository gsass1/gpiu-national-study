# frozen_string_literal: true

module Admin
  class DepartmentsController < ApplicationController
    include AdminAuthenticated
    include Admin::ResourcePage
    layout 'admin'
  end
end
