# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can [:create, :read, :update], [Hospital, Address, Department]

    if user.has_role? :admin

    end

  end
end
