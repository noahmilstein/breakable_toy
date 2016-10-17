FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "#{n}title" }
    date Date.today.strftime('%m/%d/%Y')
    sequence(:body) { |n| "#{n}body" }
    sequence(:tags) { |n| "#{n}tags" }
    user
  end
end
