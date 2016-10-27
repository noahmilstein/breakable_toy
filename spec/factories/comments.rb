FactoryGirl.define do
  factory :comment do
    sequence(:body) { |n| "#{n}#{Faker::Lorem.paragraph(3)} #{Faker::Hacker.say_something_smart}" }
    video
    user
  end
end
