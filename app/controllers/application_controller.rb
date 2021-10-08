class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale_from_params
  before_action :set_staging_flag
  before_action :redirect_incomplete_users

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name title suffix country_id])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[first_name last_name title suffix country_id email_notifications])
  end

  private

  def redirect_incomplete_users
    redirect_to finish_registration_path if current_user_incomplete? && !current_page_is_finish_registration_page?
  end

  def current_user_incomplete?
    user_signed_in? && !UserPolicy.new(current_user).finished_registration?
  end

  def current_page_is_finish_registration_page?
    ['finish_registration'].include?(controller_name)
  end

  def set_locale_from_params
    I18n.locale = params[:locale] || I18n.locale
  end

  def set_staging_flag
    @is_staging_system = !ENV['GPIU_STAGING'].nil?
  end
end
