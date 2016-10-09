FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "#{n}firstname" }
    sequence(:last_name) { |n| "#{n}lastname" }
    sequence(:username) { |n| "#{n}username" }
    sequence(:email) { |n| "#{n}email@website.com" }
    sequence(:phone) { |n| "#{n}#{n}#{n}-#{n}#{n}#{n}-#{n}#{n}#{n}#{n}" }
    sequence(:password) { |n| "#{n}password" }
    sequence(:country) { |n| "#{n}country" }
    sequence(:state) { |n| "#{n}state" }
    sequence(:city) { |n| "#{n}city" }
    sequence(:zip) { |n| "#{n}#{n}#{n}#{n}#{n}" }
    seeking_coach true
    accept_email true
  end
end
