# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

4.times do
  FactoryGirl.create(:user, admin: true)
end

prof_frink = FactoryGirl.create(
  :user,
  first_name: "Professor",
  last_name: "Frink",
  username: "Glavin",
  email: "boston.strength.coach@gmail.com",
  phone: "555-555-5555",
  password: "password",
  state: "MA",
  city: "Boston",
  zip: "02143"
)

FactoryGirl.create(
  :user,
  first_name: "John",
  last_name: "Zoidberg",
  username: "Doctorologist",
  email: "zoidberg@zoidberg.com",
  phone: "555-555-5555",
  password: "password",
  state: "NY",
  city: "New York",
  zip: "10282"
)

20.times do
  user = FactoryGirl.create(:user)
  post = FactoryGirl.create(:post, user: user)
  video = FactoryGirl.create(:video, post: post, user: user)
  comment = FactoryGirl.create(:comment, video: video, user: prof_frink )
end
