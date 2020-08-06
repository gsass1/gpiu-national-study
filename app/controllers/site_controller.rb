class SiteController < ApplicationController
  def index
    if user_signed_in?
      redirect_to dashboard_index_path
    end

    @user = User.new
  end

  def contact; end
  def about; end
end
