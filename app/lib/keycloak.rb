# frozen_string_literal: true

require 'erb'

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

  def self.logout_url(redirect_uri)
    "#{ENV['KEYCLOAK_URL']}/auth/realms/#{ENV['KEYCLOAK_REALM']}/protocol/openid-connect/logout?redirect_uri=#{ERB::Util.url_encode(redirect_uri)}"
  end
end
