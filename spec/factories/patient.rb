FactoryBot.define do
  factory :patient do
    sequence(:initial) { |n| Faker::Lorem.word + n.to_s }
    creator { create(:user) }
    department
    study_iteration
    patient_type { :uti_ssi }
  end
end
