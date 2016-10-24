require 'rails_helper'

feature 'user' do

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:post1) { FactoryGirl.create(:post, user: user1) }
  let!(:video1) { FactoryGirl.create(:video, user: user1, post: post1) }

  before :each do
    user_sign_in(user1)
  end

  scenario "user edits username" do
    visit edit_user_registration_path
    fill_in "Phone", with: "222-222-2222"
    fill_in "Enter Password", with: user1.password
    fill_in "Confirm Password", with: user1.password
    fill_in "Current Password", with: user1.password
    click_button 'Update'
    visit my_profile_users_path

    expect(page).to have_content("222-222-2222")
  end

  scenario "user deletes self" do
    visit edit_user_registration_path
    click_button "Cancel my account"

    expect(page).to have_content("Bye! Your account has been successfully "\
    "cancelled. We hope to see you again soon.")
    expect(page).to have_content("Welcome to Coachr")
  end

  scenario "user deletes post from show page" do
    visit post_path(post1)
    click_link "Delete Post"

    expect(page).to_not have_content(post1.title)
  end

  scenario "user deletes post from log page" do
    visit my_log_users_path
    click_link "Delete Post"

    expect(page).to_not have_content(post1.title)
  end

  scenario "user deletes video" do
    visit post_path(post1)
    click_link "Delete Video"

    expect(page).to_not have_content(video1.title)
  end
end
