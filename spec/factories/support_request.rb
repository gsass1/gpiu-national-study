FactoryBot.define do
  factory :support_request do
    user
    email { Faker::Internet.email }
    message { "Help" }
    support_type { :site_help }
  end
end
