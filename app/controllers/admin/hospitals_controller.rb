# frozen_string_literal: true

module Admin
  class HospitalsController < ApplicationController
    include AdminAuthenticated
    include Admin::ResourcePage
    layout 'admin'
  end
end
