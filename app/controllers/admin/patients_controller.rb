# frozen_string_literal: true

module Admin
  class PatientsController < ApplicationController
    include AdminAuthenticated
    include Admin::ResourcePage
    layout 'admin'
  end
end
