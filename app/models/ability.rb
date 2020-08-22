# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, [Address, Department, Hospital, User, Employee]
    else
      can [:create, :read, :update], [Address, Department]
      can [:create, :read, :update], Hospital, country_id: user.country_id

      can :create, Employee, department: { hospital: { country_id: user.country_id } }
      can :destroy, Employee, user_id: user.id
    end
  end
end
