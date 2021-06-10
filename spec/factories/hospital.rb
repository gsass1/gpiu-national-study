FactoryBot.define do
  factory :hospital do
    sequence(:name) { |n| Faker::Lorem.word + n.to_s }
    country
    address
    user
    acceptance_state { :approved }
  end
end
