# frozen_string_literal: true

module Admin
  class ResourceController < ApplicationController
    include AdminAuthenticated
    include Admin::ResourcePage
    layout 'admin'
  end
end
