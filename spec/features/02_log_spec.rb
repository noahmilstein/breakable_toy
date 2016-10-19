require 'rails_helper'

feature 'user has a log' do

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:post1) { FactoryGirl.create(:post, user: user1) }
  let!(:post2) { FactoryGirl.create(:post, user: user1) }
  let!(:post3) { FactoryGirl.create(:post, user: user1) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:post4) { FactoryGirl.create(:post, user: user2) }
  let(:post5) { FactoryGirl.build(:post) }

  before :each do
    user_sign_in(user1)
  end

  scenario 'user signs in, sees nav bar' do
    expect(page).to have_content("Home")
    expect(page).to have_content("Sign Out")
    expect(page).to have_content("My Profile")
    expect(page).to have_content("My Log")
  end

  scenario "user goes to show page" do
    click_link "My Profile"

    expect(page).to have_content(user1.first_name)
    expect(page).to have_content(user1.last_name)
    expect(page).to have_content(user1.email)
    expect(page).to have_content(user1.username)
    expect(page).to have_content(user1.phone)
    expect(page).to have_content(user1.country)
    expect(page).to have_content(user1.state)
    expect(page).to have_content(user1.city)
    expect(page).to have_content(user1.zip)
  end

  scenario "user sees their posts" do
    click_link "My Log"

    expect(page).to have_content(post1.title)
    expect(page).to have_link(post1.title)
    expect(page).to have_content(post2.date)
    expect(page).to_not have_content(post3.body)
    expect(page).to_not have_content(post4.title)
  end

  scenario "user creates new post in log" do
    click_link "My Log"
    click_link "Add new entry"
    create_post(post5)

    expect(page).to have_content(post5.title)
    expect(page).to have_content(post5.date)
    expect(page).to have_content(post5.body)
  end
end
