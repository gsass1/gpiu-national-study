# frozen_string_literal: true

module Keycloak
  def self.enabled?
    ENV['KEYCLOAK_URL'].present?
  end

  def self.host
    URI(ENV['KEYCLOAK_URL']).host
  end

  def self.account_management_url
    "#{ENV['KEYCLOAK_URL']}/auth/realms/#{ENV['KEYCLOAK_REALM']}/account/#/"
  end
end
