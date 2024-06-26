# frozen_string_literal: true

FactoryBot.define do
  factory :patient do
    sequence(:initial) { |n| Faker::Lorem.word + n.to_s }
    creator { create(:user) }
    department
    study_iteration
    patient_type { :uti_ssi }

    after :create, &:create_questionnaires
  end
end
