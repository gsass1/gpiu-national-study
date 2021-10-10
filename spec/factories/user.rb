FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    title { User::TITLES.sample }
    email { Faker::Internet.email }
    country
    password { "password"} 
    password_confirmation { "password" }

    trait :registered_through_keycloak do
      registered_through_keycloak { true }
      keycloak_uid { "keycloak_uid" }
      country_id { nil }
    end
  end
end
