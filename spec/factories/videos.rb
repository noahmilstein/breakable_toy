FactoryGirl.define do
  factory :video do
    sequence(:title) { |n| "#{n}#{Faker::Hipster.word}" }
    sequence(:url) { |n| "https://www.youtube.com/watch?v=tYm_#{n}#{n}#{n}#{n}2oCVdSM" }
    embed_id { "#{url}.split('=').last" }
    post
    user
    tag_list { ('a'..'z').to_a.shuffle.join }
  end
end
