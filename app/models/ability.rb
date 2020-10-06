# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, :all
    else
      can [:create, :read], SupportRequest, user_id: user.id

      can [:create, :read, :update], [Address, Department]
      can [:create, :read, :update], Hospital, country_id: user.country_id

      can :create, Employee, department: { hospital: { country_id: user.country_id } }
      can :destroy, Employee, user_id: user.id

      can [:create, :read, :update], Patient, creator_id: user.id
      can [:edit, :update], PatientIdentification, patient: { creator_id: user.id }

      # Regional admin abilities
      Country.all.each do |country|
        if user.has_role? :regional_admin, country
          can :manage, User, country_id: country.id
          can :manage, Hospital, country_id: country.id
          can :manage, StudyIteration, country_id: country.id
          can :manage, StudyRange, study_iteration: { country_id: country.id }
        end
      end
    end
  end
end
