# frozen_string_literal: true

module Gpiu
  def self.allow_local_accounts?
    Keycloak.enabled? && staging?
  end

  def self.staging?
    %w[1 yes true].include?(ENV['GPIU_STAGING'])
  end
end
