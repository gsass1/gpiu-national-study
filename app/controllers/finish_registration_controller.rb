class FinishRegistrationController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to root_path
      return
    end

    if current_user.registration_complete?
      redirect_to dashboard_index_path
    end
  end

  def create
    if @current_user.update(user_params)
      redirect_to dashboard_index_path
    else
      render :index
    end
  end

  private
  def user_params
    params.require(:user).permit(:title, :suffix, :country_id)
  end
end
