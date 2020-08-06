class SiteController < ApplicationController
  def index
    @user = User.new
  end
end
