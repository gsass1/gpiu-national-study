FactoryBot.define do
  factory :country do
    sequence(:name) { |n| "Country #{n}" }
    iso_2 { Faker::Kpop.boy_bands }
    iso_3 { Faker::Kpop.boy_bands }
    timezone { "UTC" }
  end
end
