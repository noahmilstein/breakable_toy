FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "#{n}firstname" }
    sequence(:last_name) { |n| "#{n}lastname" }
    sequence(:username) { |n| "#{n}username" }
    sequence(:email) { |n| "#{n}email@website.com" }
    sequence(:phone) { |n| "#{n}#{n}#{n}-#{n}#{n}#{n}-#{n}#{n}#{n}#{n}" }
    sequence(:password) { |n| "#{n}password" }
    country "United States"
    state "NY"
    sequence(:city) { |n| "#{n}city" }
    sequence(:zip) { |n| "#{n}#{n}#{n}#{n}#{n}" }
    seeking_coach true
    accept_email true
    accept_phone true
  end
end
