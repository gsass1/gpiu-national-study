FactoryBot.define do
  factory :study_iteration do
    sequence(:name) { |n| Faker::Lorem.word + n.to_s }
    country
    acceptance_state { :unsubmitted }
  end
end
