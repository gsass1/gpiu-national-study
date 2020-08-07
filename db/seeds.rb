# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Setup participating countries
Country.create(iso: "GBR", name: "United Kingdom")
Country.create(iso: "TUR", name: "Tukrey")
Country.create(iso: "FRA", name: "France")
Country.create(iso: "CZE", name: "Czech Republic")
Country.create(iso: "NOR", name: "Norway")
Country.create(iso: "IRN", name: "Iran")
