FactoryGirl.define do
  factory :comment do
    sequence(:body) { |n| "#{n}body" }
    video
    user
  end
end

# FactoryGirl.define do
#   factory :comment do
#     sequence(:body) { |n| "#{n}body" }
#     video
#   end
# end
