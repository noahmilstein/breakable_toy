require 'rails_helper'

feature 'user has a log' do

  # before :each do
  #   user_sign_in(user1)
  # end

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:post1) { FactoryGirl.create(:post, user: user1) }
  let!(:video1) { FactoryGirl.create(:video, user: user1, post: post1) }

  let!(:user2) { FactoryGirl.create(:user) }
  let!(:post2) { FactoryGirl.create(:post, user: user2) }
  let!(:post3) { FactoryGirl.create(:post, user: user2) }
  let!(:video2) { FactoryGirl.create(:video, user: user2, post: post2) }
  let!(:video3) { FactoryGirl.create(:video, user: user2, post: post2) }


  scenario 'user submits new video in post' do
    user_sign_in(user1)
    click_link "My Log"
    click_link "Add new entry"
    create_post(post1)

    expect(page).to have_content(post1.title)
    expect(page).to have_content(post1.date)
    expect(page).to have_content(post1.body)
    expect(page).to have_content(post1.tags)
  end

  scenario 'user adds videos to post' do
    user_sign_in(user1)
    visit user_post_path(user1, post1)
    fill_in "Video Url", with: "https://www.youtube.com/watch?v=h2q6v0AChyw"
    click_button "Submit"

    expect(page).to have_content(video1.title)
    expect(page).to have_link(video1.title)
  end

  scenario 'user inspects post, sees index of post videos' do
    user_sign_in(user1)
    click_link "My Log"
    click_link post1.title

    expect(page).to have_content(video1.title)
  end

  scenario "user navigates to video show page, see video" do
    user_sign_in(user2)
    visit user_post_path(user2, post2)
    click_link video2.title

    expect(page).to have_content(video2.title)
    expect(page).to have_css("iframe")
  end
end
