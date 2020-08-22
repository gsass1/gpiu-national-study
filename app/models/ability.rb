# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, [Address, Department, Hospital, User]
    else
      can [:create, :read, :update], [Address, Department]
      can [:create, :read, :update], Hospital, country_id: user.country_id
    end
  end
end
