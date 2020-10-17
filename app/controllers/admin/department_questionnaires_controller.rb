class Admin::DepartmentQuestionnairesController < ApplicationController
  include AdminAuthenticated
  include Admin::ResourcePage
  layout 'admin'
end
