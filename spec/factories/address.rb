# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    street { "#{Faker::Address.street_name} #{rand(1..200)}" }
    zip_code { rand(10_000..99_999).to_s }
    city { Faker::Address.city }
  end
end
