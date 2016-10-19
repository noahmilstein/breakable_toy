FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "#{n}title" }
    date Date.today.strftime('%m/%d/%Y')
    body Faker::Lorem.paragraph(3)
    tags Faker::Lorem.word
    user

    trait :with_videos do
      after(:build) do |post|
        create(:video, post: post)
      end
    end
  end
end


# factory :classroom do |f|
#   sequence(:title)  { |n| "Class #{n}}" }
#   active true
#   teacher
#
#   trait :with_students do
#     after(:build) do |classroom|
#       create(:student, classroom: classroom)
#     end
#   end
#
#   trait :with_support_teacher do
#     after(:create) do |classroom|
#       classroom.support_teacher = create(:teacher)
#     end
#   end
# end

# trait :with_students do
#   after(:build) do |classroom|
#     create_pair(:student, classroom: classroom)
#   end
# end
#
# trait :with_students do
#   after(:build) do |classroom|
#     create_list(:student, 25, classroom: classroom)
#   end
# end



# FactoryGirl.define do
#
#   # post factory with a `belongs_to` association for the user
#   factory :post do
#     title "Through the Looking Glass"
#     user
#   end
#
#   # user factory without associated posts
#   factory :user do
#     name "John Doe"
#
#     # user_with_posts will create post data after the user has been created
#     factory :user_with_posts do
#       # posts_count is declared as a transient attribute and available in
#       # attributes on the factory, as well as the callback via the evaluator
#       transient do
#         posts_count 5
#       end
#
#       # the after(:create) yields two values; the user instance itself and the
#       # evaluator, which stores all values from the factory, including transient
#       # attributes; `create_list`'s second argument is the number of records
#       # to create and we make sure the user is associated properly to the post
#       after(:create) do |user, evaluator|
#         create_list(:post, evaluator.posts_count, user: user)
#       end
#     end
#   end
# end
