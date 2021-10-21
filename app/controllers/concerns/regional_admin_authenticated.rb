# frozen_string_literal: true

module RegionalAdminAuthenticated
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_regional_admin_user!
  end

  def current_country
    @country ||= Country.find_by(iso_2: params[:country].upcase) # rubocop:disable Naming/MemoizedInstanceVariableName
  end

  def authenticate_regional_admin_user!
    return if UserPolicy.new(current_user).can_access_regional_admin?(current_country)

    redirect_to root_path, flash: { alert: 'You are not a regional admin for this country.' }
  end
end
