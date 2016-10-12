require 'rails_helper'

feature 'user has a log' do

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:post1) { FactoryGirl.create(:post, user: user1) }
  let!(:post2) { FactoryGirl.create(:post, user: user1) }
  let!(:post3) { FactoryGirl.create(:post, user: user1) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:post4) { FactoryGirl.create(:post, user: user2) }
  let(:post5) { FactoryGirl.build(:post) }

  scenario 'user submits new post with video' do
    # visit root_path
    # click_link 'Sign In'
    # user_sign_in(user1)
    # click_button 'Submit'

    # expect(page).to have_content("Home")
    # expect(page).to have_content("Sign Out")
    # expect(page).to have_content("My Profile")
    # expect(page).to have_content("My Log")
  end
end
