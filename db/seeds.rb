# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

100.times { FactoryGirl.build(:user, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.user_name, email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number, password: Faker::Internet.password(6, 20), country: Faker::Address.country, state: Faker::Address.state_abbr, city: Faker::Address.city, zip: Faker::Address.zip, admin: false ) }

20.times { FactoryGirl.create(:user, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.user_name, email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number, password: Faker::Internet.password(6, 20), country: Faker::Address.country, state: Faker::Address.state_abbr, city: Faker::Address.city, zip: Faker::Address.zip, admin: true ) }
