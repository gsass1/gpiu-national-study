module RegionalAdminAuthenticated
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_regional_admin_user!
  end

  def current_country
    @country ||= Country.find_by_iso_2(params[:country].upcase)
  end

  def authenticate_regional_admin_user!
    redirect_to root_path, flash: { alert: "You are not a regional admin for this country." } unless current_user.has_role? :regional_admin, current_country
  end
end