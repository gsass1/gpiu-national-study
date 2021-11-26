# frozen_string_literal: true

module StudyIterations
  module Departments
    extend ActiveSupport::Concern

    included do
      has_many :department_questionnaires, dependent: :destroy
      has_many :departments, through: :department_questionnaires

      after_save :create_department_questionnaires, if: :became_accepted?
    end

    def became_accepted?
      acceptance_state_previously_changed?(to: 'accepted')
    end

    def create_department_questionnaires
      Department.includes(:hospital)
        .where(hospitals: { country_id: country_id })
        .find_each(&:create_department_questionnaire)
    end
  end
end
