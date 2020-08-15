# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Setup participating countries
Country.create(iso_2: "GB", iso_3: "GBR", name: "United Kingdom")
Country.create(iso_2: "TR", iso_3: "TUR", name: "Turkey")
Country.create(iso_2: "FR", iso_3: "FRA", name: "France")
Country.create(iso_2: "CZ", iso_3: "CZE", name: "Czech Republic")
Country.create(iso_2: "NO", iso_3: "NOR", name: "Norway")
Country.create(iso_2: "IR", iso_3: "IRN", name: "Iran")

if Rails.env.development?
  puts 'Generating Test User'
  user = User.create!(first_name: 'Admin', last_name: 'Adminson', email: 'admin@test.de', country: Country.first, password: 'test123', password_confirmation: 'test123')
  user.add_role :admin
  user.save!
end