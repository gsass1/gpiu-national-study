class HospitalController < ApplicationController
  include Authenticated
  load_and_authorize_resource

  def index; end
  def show; end
end
