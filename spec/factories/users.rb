FactoryGirl.define do
  factory :user do
    first_name  Faker::Name.first_name
    last_name  Faker::Name.last_name
    sequence(:username) { |n| "#{n}username" }
    sequence(:email) { |n| "#{n}email@website.com" }
    phone  Faker::PhoneNumber.phone_number
    password  Faker::Internet.password(6, 20)
    state  Faker::Address.state_abbr
    city  Faker::Address.city
    sequence(:zip) { |n| "#{n}#{n}#{n}#{n}#{n}" }
    seeking_coach true
    accept_email true
    accept_phone true
  end
end

# FactoryGirl.define do
#   factory :user do
#     first_name  Faker::Name.first_name
#     last_name  Faker::Name.last_name
#     sequence(:username) { |n| "#{n}username" }
#     sequence(:email) { |n| "#{n}email@website.com" }
#     phone Faker::PhoneNumber.phone_number
#     password Faker::Internet.password(6, 20)
#     country Faker::Address.country
#     state Faker::Address.state_abbr
#     city Faker::Address.city
#     sequence(:zip) { |n| "#{n}#{n}#{n}#{n}#{n}" }
#     seeking_coach true
#     accept_email true
#     accept_phone true
#
#     trait :with_10_posts do
#       after(:create) do |user|
#         create_list(:post, 10, :with_videos, user: user)
#       end
#     end
#   end
# end
