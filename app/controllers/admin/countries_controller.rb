class Admin::CountriesController < ApplicationController
  include AdminAuthenticated
  include Admin::ResourcePage
  layout 'admin'
end
