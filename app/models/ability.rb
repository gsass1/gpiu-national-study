# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, :all
    else
      can [:create, :read], SupportRequest, user_id: user.id

      can [:create, :read, :update], Address
      can [:create, :read, :update], Department, { hospital: { country_id: user.country_id, acceptance_state: :approved } }

      can [:create], Hospital, country_id: user.country_id
      can [:create, :edit, :read, :update], Hospital, user_id: user.id

      can :create, Employee, department: { hospital: { country_id: user.country_id } }
      can :destroy, Employee, user_id: user.id

      can [:create, :read, :update], Patient, creator_id: user.id
      can :edit, PatientIdentification,  patient: { creator_id: user.id }
      can :update, PatientIdentification,  patient: { creator_id: user.id, locked: false }

      unless user.country.current_study_iteration.nil?
        can_edit_update_questionnaire user, SsiQuestionnaire
        can_edit_update_questionnaire user, UtiQuestionnaire
        can_edit_update_questionnaire user, BiopsyQuestionnaire
        can_edit_update_questionnaire user, BiopsyOutcomeQuestionnaire
      end

      can [:edit, :update], DepartmentQuestionnaire, department: { users: { id: user.id } }

      # Regional admin abilities
      Country.all.each do |country|
        if user.has_role? :regional_admin, country
          #can :manage, Country, id: country.id
          can :read, User, country_id: country.id
          can :manage, Hospital, country_id: country.id
          can :manage, StudyIteration, country_id: country.id
          can :manage, StudyRange, study_iteration: { country_id: country.id }
        end
      end
    end
  end

  private
  def can_edit_update_questionnaire(user, questionnaire)
    can :edit, questionnaire, patient: { creator_id: user.id, study_iteration_id: user.country.current_study_iteration.id }
    can :update, questionnaire, patient: { creator_id: user.id, study_iteration_id: user.country.current_study_iteration.id, locked: false }
  end
end
