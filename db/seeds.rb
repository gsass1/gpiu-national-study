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
  puts 'Generating Test Users'

  puts 'Admin'
  admin = User.new(first_name: Faker::Name.first_name,
                      last_name: Faker::Name.middle_name,
                      title: User::TITLES.sample,
                      email: 'admin@test.de',
                      country: Country.all.sample,
                      password: 'test123',
                      password_confirmation: 'test123')
  admin.add_role :admin
  admin.save!

  puts 'Regional Admin'
  region = Country.all.sample
  radmin = User.new(first_name: Faker::Name.first_name,
                   last_name: Faker::Name.middle_name,
                   title: User::TITLES.sample,
                   email: 'regional@test.de',
                   country: region,
                   password: 'test123',
                   password_confirmation: 'test123')
  radmin.add_role :regional_admin, region
  radmin.save!

  puts 'Users'
  5.times do |i|
    User.create!(first_name: Faker::Name.first_name,
             last_name: Faker::Name.middle_name,
             email: "user#{i}@test.de",
             title: User::TITLES.sample,
             country: Country.all.sample,
             password: 'test123',
             password_confirmation: 'test123')
  end

  #TODO: Seed Hospitals / Departments / etc...
end
