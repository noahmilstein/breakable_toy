FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "#{n}title" }
    date "06/06/2016"
    sequence(:body) { |n| "#{n}body" }
    sequence(:tags) { |n| "#{n}tags" }
    user
  end
end
