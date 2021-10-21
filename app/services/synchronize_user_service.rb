# frozen_string_literal: true

class SynchronizeUserService < BaseService
  def initialize(auth)
    @auth = auth
  end

  def call
    user = find_or_create_user

    return user if user.persisted? && synchronize_with_info(user)

    nil
  end

  private

  attr_reader :auth

  def find_or_create_user
    User.where(keycloak_uid: auth.uid).first_or_create do |user|
      synchronize_with_info(user)
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def synchronize_with_info(user)
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.email = auth.info.email
    user.registered_through_keycloak = true
  end
end
