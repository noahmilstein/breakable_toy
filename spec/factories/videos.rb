FactoryGirl.define do
  factory :video do
    sequence(:title) { |n| "#{n}title" }
    sequence(:url) { |n| "https://www.youtube.com/watch?v=tYm_#{n}2oCVdSM" }
    embed_id { "#{url}.split('=').last" }
    post
    user
  end
end
