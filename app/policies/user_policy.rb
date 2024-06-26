# frozen_string_literal: true

class UserPolicy
  def initialize(user)
    @user = user
  end

  def can_access_regional_admin?(country)
    signed_in? && (regional_admin_for?(country) || admin?)
  end

  def can_access_admin?
    signed_in? && admin?
  end

  def finished_registration?
    signed_in? && @user.registration_complete?
  end

  def signed_in?
    !@user.nil?
  end

  def regional_admin_for?(country)
    @user.has_role?(:regional_admin, country)
  end

  def admin?
    @user.has_role?(:admin)
  end

  def can_export_data?(study_iteration)
    signed_in? && (admin? || (regional_admin_for?(study_iteration.country) && study_iteration.exportable?))
  end
end
