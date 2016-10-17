require 'rails_helper'

feature 'user' do

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:post1) { FactoryGirl.create(:post, user: user1) }
  let!(:video1) { FactoryGirl.create(:video, user: user1, post: post1) }
  let!(:video2) { FactoryGirl.create(:video, user: user1, post: post1) }
  let!(:video3) { FactoryGirl.create(:video, user: user1, post: post1) }
  let!(:comment1) { FactoryGirl.create(:comment, user: user1, video: video1) }
  let!(:comment2) { FactoryGirl.create(:comment, user: user1, video: video1) }
  let!(:comment3) { FactoryGirl.create(:comment, user: user1, video: video2) }

  scenario "sees videos in video index" do
    user_sign_in(user1)
    click_link "Video Index"

    expect(page).to have_css("iframe")
    expect(page).to have_content(video1.title)
    expect(page).to have_content(video2.title)
    expect(page).to have_content(video3.title)
  end

  scenario "sees first video comment per video on video index" do
    user_sign_in(user1)
    visit videos_path

    expect(page).to have_content(comment2.body)
    expect(page).to_not have_content(comment1.body)
    expect(page).to have_content(comment3.body)
  end

  scenario "user navigates to video show from index" do
    user_sign_in(user1)
    visit videos_path
    click_link video1.title

    expect(page).to have_content(video1.title)
    expect(page).to_not have_content(video2.title)
    expect(page).to have_css("iframe")
    expect(page).to have_content(comment1.body)
    expect(page).to have_content(comment2.body)
  end
end
