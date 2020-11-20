class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale_from_params

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :title, :suffix, :country_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :title, :suffix, :country_id, :email_notifications])
  end

  private

  def set_locale_from_params
    I18n.locale = params[:locale] || I18n.locale
  end
end
