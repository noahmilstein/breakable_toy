FactoryGirl.define do
  factory :user do
    first_name  Faker::Name.first_name
    last_name  Faker::Name.last_name
    sequence(:username) { |n| "#{n}#{Faker::Internet.user_name}#{Faker::Number.number(5)}#{Faker::Hipster.word}" }
    sequence(:email) { |n| "#{n}#{Faker::Hipster.word}#{Faker::Number.number(5)}#{Faker::Internet.email}" }
    phone  Faker::PhoneNumber.phone_number
    password  Faker::Internet.password(6, 20)
    state  Faker::Address.state_abbr
    city  Faker::Address.city
    image Faker::Avatar.image
    sequence(:zip) { |n| "#{n}#{n}#{n}#{n}#{n}" }
    seeking_coach true
    accept_email true
    accept_phone true
  end
end
