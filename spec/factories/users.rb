FactoryGirl.define do
  factory :user do
    first_name  Faker::Name.first_name
    last_name  Faker::Name.last_name
    sequence(:username) { |n| "#{n}username" }
    sequence(:email) { |n| "#{n}email@website.com" }
    phone  Faker::PhoneNumber.phone_number
    password  Faker::Internet.password(6, 20)
    country  Faker::Address.country
    state  Faker::Address.state_abbr
    city  Faker::Address.city
    zip  Faker::Address.zip
    seeking_coach true
    accept_email true
    accept_phone true
  end
end
