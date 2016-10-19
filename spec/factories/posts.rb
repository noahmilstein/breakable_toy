FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "#{n}title" }
    date Date.today.strftime('%m/%d/%Y')
    body Faker::Lorem.paragraph(3)
    user

    # trait :with_videos do
    #   after(:build) do |post|
    #     create(:video, post: post)
    #   end
    # end
  end
end

# FactoryGirl.define do
#   factory :post do
#     sequence(:title) { |n| "#{n}title" }
#     date Date.today.strftime('%m/%d/%Y')
#     body Faker::Lorem.paragraph
#     user
#
#     trait :with_videos do
#       after(:create) do |post|
#         create(:video, :with_comments, post: post)
#       end
#     end
#   end
# end
