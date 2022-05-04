# frozen_string_literal: true

module DeviseConfiguration
  extend ActiveSupport::Concern

  included do
    devise(*devise_flags)
  end

  class_methods do
    def devise_flags
      flags = BASE_FLAGS.dup

      if Keycloak.enabled?
        flags.push(:recoverable) if GPIU.allow_local_accounts?
        flags.push(*KEYCLOAK_FLAGS)
      else
        flags.push(:recoverable)

        # HACK: always enable omniauth in test, because after stubbing
        # Keycloak::enabled? you cannot reload the User class?
        flags.push(*KEYCLOAK_FLAGS) if Rails.env.test?
      end

      flags
    end
  end

  BASE_FLAGS = %i[database_authenticatable
                  validatable
                  trackable
                  rememberable
                  registerable].freeze

  KEYCLOAK_FLAGS = [:omniauthable, omniauth_providers: [:keycloakopenid]].freeze # rubocop:disable Style/HashAsLastArrayItem
end
