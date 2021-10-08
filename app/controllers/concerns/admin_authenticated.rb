# frozen_string_literal: true

module AdminAuthenticated
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_admin_user!
  end

  def authenticate_admin_user!
    unless UserPolicy.new(current_user).can_access_admin?
      redirect_to root_path,
                  flash: { alert: 'You are not an admin.' }
    end
  end
end
