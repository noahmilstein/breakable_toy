require 'rails_helper'

feature 'user' do

  let!(:op_user) { FactoryGirl.create(:user) }
  let!(:admin_user) { FactoryGirl.create(:user, admin: true) }
  let!(:npc_user) { FactoryGirl.create(:user) }

  let!(:post1) { FactoryGirl.create(:post, user: op_user) }
  let!(:video1) { FactoryGirl.create(:video, user: op_user, post: post1) }
  let!(:comment1) { FactoryGirl.create(:comment, user: op_user, video: video1) }
  let!(:comment2) { FactoryGirl.create(:comment, user: npc_user, video: video1) }
  let!(:comment3) { FactoryGirl.create(:comment, user: admin_user, video: video1) }

  scenario "non-OP/non-admin cannot comment on video" do
    user_sign_in(npc_user)
    visit post_video_path(post1, video1)

    expect(page).to_not have_button("Submit Comment")
  end

  scenario "OP can comment on video" do
    user_sign_in(op_user)
    visit post_video_path(post1, video1)
    create_comment(comment1)

    expect(page).to have_css('div.comment', text: comment1.body)
    expect(page).to have_css('div.comment', text: comment1.user.username)
    expect(page).to_not have_content("Only OP or admin may comment")
  end

  scenario "admin can comment on video" do
    user_sign_in(admin_user)
    visit post_video_path(post1, video1)
    create_comment(comment3)

    expect(page).to have_css('div.comment', text: comment3.body)
    expect(page).to have_css('div.comment', text: comment3.user.username)
    expect(page).to_not have_content("Only OP or admin may comment")
  end

  scenario "non-OP/non-admin cannot create video" do
    user_sign_in(npc_user)
    visit post_video_path(post1, video1)

    expect(page).to_not have_button("Submit Video")
  end
end
