# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Category.destroy_all

puts "Creating users..."

User.create(
    email: "simeo@simeo.co.uk",
    password: 123456,
    first_name: "Simeo",
    last_name: "Russo",
    address: Faker::Address.street_address
)
User.create(
    email: "shreya@shreya.co.uk",
    password: 123456,
    first_name: "Shreya",
    last_name: "Gupta",
    address: Faker::Address.street_address
)
User.create(
    email: "dorothy@dorothy.co.uk",
    password: 123456,
    first_name: "Dorothy",
    last_name: "Yau",
    address: Faker::Address.street_address
)
User.create(
    email: "david@david.co.uk",
    password: 123456,
    first_name: "David",
    last_name: "Magueijo",
    address: Faker::Address.street_address
)

puts "Creating categories..."

Category.create(name: "Doll")
Category.create(name: "Electronic toy")
Category.create(name: "Lego")
Category.create(name: "Soft toy")
Category.create(name: "Disney")
Category.create(name: "Action figure")
Category.create(name: "Wooden toy")
Category.create(name: "Educational")
Category.create(name: "Board games")
Category.create(name: "Puzzle")

puts "Finished!"