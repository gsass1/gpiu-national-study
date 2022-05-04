# frozen_string_literal: true

module GPIU
  def self.allow_local_accounts?
    Keycloak.enabled? && staging?
  end

  def self.staging?
    %w[1 yes true].include?(ENV['GPIU_STAGING'])
  end

  def self.enable_cookie_banner?
    !Rails.env.test?
  end
end
