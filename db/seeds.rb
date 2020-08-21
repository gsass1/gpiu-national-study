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
  NUM_USERS = 5
  NUM_HOSPITALS = 5
  NUM_MAX_DEPTS = 5

  EXAMPLE_SUFFIXES = ["B.Sc.", "M.Sc.", "PhD", "MD", ""].freeze

  def dept_name
    "#{Faker::Movies::StarWars.planet} #{Faker::Movies::StarWars.call_sign}"
  end

  puts 'Generating Test Users'

  puts "\t* Admin"
  admin = User.new(first_name: Faker::Name.first_name,
                      last_name: Faker::Name.middle_name,
                      title: User::TITLES.sample,
                      suffix: EXAMPLE_SUFFIXES.sample,
                      email: 'admin@test.de',
                      country: Country.all.sample,
                      password: 'test123',
                      password_confirmation: 'test123')
  admin.add_role :admin
  admin.save!

  puts "\t* Regional Admin"
  region = Country.all.sample
  radmin = User.new(first_name: Faker::Name.first_name,
                   last_name: Faker::Name.middle_name,
                   title: User::TITLES.sample,
                   suffix: EXAMPLE_SUFFIXES.sample,
                   email: 'regional@test.de',
                   country: region,
                   password: 'test123',
                   password_confirmation: 'test123')
  radmin.add_role :regional_admin, region
  radmin.save!

  puts "\t* #{NUM_USERS} Users"
  NUM_USERS.times do |i|
    User.create!(first_name: Faker::Name.first_name,
             last_name: Faker::Name.middle_name,
             email: "user#{i}@test.de",
             title: User::TITLES.sample,
             suffix: EXAMPLE_SUFFIXES.sample,
             country: Country.all.sample,
             password: 'test123',
             password_confirmation: 'test123')
  end

  puts "#{NUM_HOSPITALS} Hospitals with up to #{NUM_MAX_DEPTS} Departments"
  NUM_HOSPITALS.times do |i|
    address = Address.create!(street: Faker::Address.street_address,
                              zip_code: Faker::Address.zip_code,
                              city: Faker::Address.city)

    hospital = Hospital.create!(name: "#{Faker::Movies::StarWars.character} Hospital",
                                country: Country.all.sample,
                                address: address,
                                first_department_name: dept_name)

    rand(0..NUM_MAX_DEPTS-1).times do |dept_i|
      dept = Department.create!(hospital: hospital,
                                name: dept_name)
    end
  end
end
