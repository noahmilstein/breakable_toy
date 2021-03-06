require 'rails_helper'

feature 'user' do

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:post1) { FactoryGirl.create(:post, user: user1) }
  let!(:video1) { FactoryGirl.create(:video, user: user1, post: post1) }
  let!(:comment1) { FactoryGirl.create(:comment, user: user1, video: video1) }
  let!(:comment2) { FactoryGirl.create(:comment, user: user1, video: video1) }
  let!(:comment3) { FactoryGirl.create(:comment, user: user1, video: video1) }

  before :each do
    user_sign_in(user1)
    visit video_path(video1)
  end

  scenario "leaves comment on their own video" do
    fill_in "Comment", with: "This is a comment"
    click_button "Submit Comment"

    expect(page).to have_content("This is a comment")
  end

  scenario "sees all comments on video show page" do
    expect(page).to have_content(comment1.body)
    expect(page).to have_content(comment2.body)
    expect(page).to have_content(comment3.body)
  end
end
