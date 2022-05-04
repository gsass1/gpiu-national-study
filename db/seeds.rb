# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Setup participating countries
puts "Seeding Database..."
puts "Seeding participating countries"
Country.find_or_create_by(iso_2: "GB", iso_3: "GBR", name: "United Kingdom", timezone: "Europe/London")
Country.find_or_create_by(iso_2: "DE", iso_3: "DEU", name: "Germany", timezone: "Europe/Berlin")
Country.find_or_create_by(iso_2: "ES", iso_3: "ESP", name: "Spain", timezone: "Europe/Madrid")
Country.find_or_create_by(iso_2: "TR", iso_3: "TUR", name: "Turkey", timezone: "Europe/Istanbul")
Country.find_or_create_by(iso_2: "NO", iso_3: "NOR", name: "Norway", timezone: "Europe/Oslo")
Country.find_or_create_by(iso_2: "IR", iso_3: "IRN", name: "Iran", timezone: "Iran")
Country.find_or_create_by(iso_2: "HU", iso_3: "HUN", name: "Hungary", timezone: "Europe/Budapest")
Country.find_or_create_by(iso_2: "AU", iso_3: "AUS", name: "Australia", timezone: "Australia/Sydney")
Country.find_or_create_by(iso_2: "FR", iso_3: "FRA", name: "France", timezone: "Europe/Paris")
Country.find_or_create_by(iso_2: "GH", iso_3: "GHA", name: "Ghana", timezone: "GMT")
Country.find_or_create_by(iso_2: "KZ", iso_3: "KAZ", name: "Kazakhstan", timezone: "Asia/Almaty")
Country.find_or_create_by(iso_2: "MY", iso_3: "MYS", name: "Malaysia", timezone: "Asia/Kuala_Lumpur")
Country.find_or_create_by(iso_2: "PT", iso_3: "PRT", name: "Portugal", timezone: "Europe/Lisbon")
Country.find_or_create_by(iso_2: "RO", iso_3: "ROU", name: "Romania", timezone: "Europe/Bucharest")

if Rails.env.development? or GPIU.staging?
  NUM_USERS = 5
  NUM_HOSPITALS = 10
  NUM_MAX_DEPTS = 5

  EXAMPLE_SUFFIXES = ["B.Sc.", "M.Sc.", "PhD", "MD", ""].freeze

  def dept_name
    "#{Faker::Movies::StarWars.planet} #{Faker::Movies::StarWars.call_sign}"
  end

  puts 'Generating Test Users:'

  puts "\t* Admin"
  admin = User.new(first_name: Faker::Name.first_name,
                      last_name: Faker::Name.middle_name,
                      title: User::TITLES.sample,
                      suffix: EXAMPLE_SUFFIXES.sample,
                      email: 'admin@test.org',
                      country: Country.all.sample,
                      password: 'test123',
                      password_confirmation: 'test123')
  admin.add_role :admin
  admin.save!

  puts "\t* Regional Admin for each Country"
  Country.all.each do |country|
    radmin = User.new(first_name: Faker::Name.first_name,
                     last_name: Faker::Name.middle_name,
                     title: User::TITLES.sample,
                     suffix: EXAMPLE_SUFFIXES.sample,
                     email: "regional_#{country.iso_2}@test.org",
                     country: country,
                     password: 'test123',
                     password_confirmation: 'test123')
    radmin.add_role :regional_admin, country
    radmin.save!
  end

  puts "\t* #{NUM_USERS} Users"
  NUM_USERS.times do |i|
    User.create!(first_name: Faker::Name.first_name,
             last_name: Faker::Name.middle_name,
             email: "user#{i+1}@test.org",
             title: User::TITLES.sample,
             suffix: EXAMPLE_SUFFIXES.sample,
             country: Country.all.sample,
             password: 'test123',
             password_confirmation: 'test123')
  end

  puts "Generating #{NUM_HOSPITALS} Hospitals with up to #{NUM_MAX_DEPTS} Departments"
  NUM_HOSPITALS.times do |i|
    address = Address.create!(street: "#{Faker::Address.street_name} #{rand(1..200)}",
                              zip_code: rand(10000..99999).to_s,
                              city: Faker::Address.city)

    country = Country.all.sample
    user = User.where(country_id: country.id).sample
    hospital = Hospital.create!(name: "#{Faker::Movies::StarWars.unique.character} Hospital",
                                country: country,
                                address: address,
                                user: user,
                                first_department_name: dept_name,
                                acceptance_state: :accepted)

    rand(0..NUM_MAX_DEPTS-1).times do |dept_i|
      dept = Department.create(hospital: hospital,
                                name: dept_name)
    end
  end
end
puts "Seed has been applied"
