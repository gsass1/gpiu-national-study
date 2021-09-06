FactoryBot.define do
  factory :department do
    sequence(:name) { |n| "Department no. #{n}" }
    hospital
  end
end
