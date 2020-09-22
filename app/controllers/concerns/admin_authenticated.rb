module AdminAuthenticated
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_admin_user!
  end

  def authenticate_admin_user!
    redirect_to root_path, flash: { alert: "You are not an admin." } unless current_user.has_role? :admin
  end
end