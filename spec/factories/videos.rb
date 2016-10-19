FactoryGirl.define do
  factory :video do
    sequence(:title) { |n| "#{n}title" }
    sequence(:url) { |n| "https://www.youtube.com/watch?v=tYm_#{n}#{n}#{n}#{n}2oCVdSM" }
    embed_id { "#{url}.split('=').last" }
    post
    user
    tag_list { ('a'..'z').to_a.shuffle.join }
    
    # trait :with_comments do
    #   after(:build) do |video|
    #     create(:comment, video: video)
    #   end
    # end
  end
end

# FactoryGirl.define do
#   factory :video do
#     sequence(:title) { |n| "#{n}title" }
#     sequence(:url) { |n| "https://www.youtube.com/watch?v=tYm_#{n}2oCVdSM" }
#     post
#
#     trait :with_comments do
#       after(:create) do |video|
#         create(:comment, video: video)
#       end
#     end
#   end
# end
