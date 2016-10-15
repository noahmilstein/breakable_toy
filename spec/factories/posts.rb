FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "#{n}title" }
    date Date.today.strftime('%m/%d/%Y')
    # videos "https://www.youtube.com/watch?v=tYm_2oCVdSM, https://www.youtube.com/watch?v=o-iqifrXT44"
    sequence(:body) { |n| "#{n}body" }
    sequence(:tags) { |n| "#{n}tags" }
    user
  end
end
