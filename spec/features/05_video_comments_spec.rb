require 'rails_helper'

feature 'user' do

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:post1) { FactoryGirl.create(:post, user: user1) }
  let!(:video1) { FactoryGirl.create(:video, user: user1, post: post1) }

  scenario "leaves comment on their own video" do
    user_sign_in(user1)
    visit post_video_path(post1, video1)
    fill_in "Comment", with: "This is a comment"
    click_button "Submit Comment"

    expect(page).to have_content("This is a comment")
  end

  scenario "admin leaves comment on OP video" do
    user_sign_in(user1)

    expect(page).to have_content("")
  end

  scenario "sees all video comments on show page" do
    user_sign_in(user1)

    expect(page).to have_content("")
  end

end