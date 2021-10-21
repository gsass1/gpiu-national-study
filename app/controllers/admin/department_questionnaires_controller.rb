# frozen_string_literal: true

module Admin
  class DepartmentQuestionnairesController < ResourceController
    include AdminAuthenticated
    include Admin::ResourcePage
    layout 'admin'
  end
end
