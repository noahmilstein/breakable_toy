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

  scenario "OP can delete post" do
    user_sign_in(op_user)
    visit post_video_path(post1, video1)
    click_link "Delete"

    expect(page).to_not have_content(video1.title)
  end

  scenario "OP can edit post" do
    user_sign_in(op_user)
    visit post_video_path(post1, video1)
    click_link "Edit"
    fill_in "Tags", with: "Frank Zappa"
    click_button "Submit Video"

    expect(page).to have_content("Video successfully updated!")
  end

  scenario "non-OP/non-admin cannot edit post" do
    user_sign_in(npc_user)
    visit post_video_path(post1, video1)

    expect(page).to_not have_content("Edit")
    expect(page).to_not have_content("Delete")
  end

  scenario "admin cannot edit or delete OP post" do
    user_sign_in(admin_user)
    visit post_video_path(post1, video1)

    expect(page).to_not have_content("Edit")
    expect(page).to_not have_content("Delete")
  end

  xscenario "non-OP/non-admin cannot edit video" do
  end

  xscenario "non-OP/non-admin cannot delete video" do
  end

  xscenario "OP can edit video" do
  end

  xscenario "OP can delete video" do
  end

  xscenario "admin cannot edit OP video" do
  end

  xscenario "admin cannot delete OP video" do
  end

  xscenario "non-OP/non-admin cannot edit comment" do
  end

  xscenario "non-OP/non-admin cannot delete comment" do
  end

  xscenario "OP can edit comment" do
  end

  xscenario "OP can delete comment" do
  end

  xscenario "admin cannot edit OP comment" do
  end

  xscenario "admin cannot delete OP comment" do
  end
end
