class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :country, :country_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :country, :country_id])
  end
end
