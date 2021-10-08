# frozen_string_literal: true

module Admin
  class PatientIdentificationsController < ApplicationController
    include AdminAuthenticated
    include Admin::ResourcePage
    layout 'admin'
  end
end
