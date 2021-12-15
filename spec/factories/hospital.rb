# frozen_string_literal: true

FactoryBot.define do
  factory :hospital do
    sequence(:name) { |n| Faker::Lorem.word + n.to_s }
    country
    address
    user
    acceptance_state { :accepted }
  end
end
