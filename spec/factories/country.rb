FactoryBot.define do
  factory :country do
    sequence(:name) { |n| "Country #{n}" }
    iso_2 { ('A'..'Z').to_a.sample(2).join }
    iso_3 { ('A'..'Z').to_a.sample(3).join }
    timezone { "UTC" }
  end
end
