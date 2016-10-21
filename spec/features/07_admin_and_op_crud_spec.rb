require "rails_helper"

feature "user" do

  let!(:op_user) { FactoryGirl.create(:user) }
  let!(:op_user2) { FactoryGirl.create(:user) }
  let!(:admin_user) { FactoryGirl.create(:user, admin: true) }
  let!(:admin_user2) { FactoryGirl.create(:user, admin: true) }
  let!(:npc_user) { FactoryGirl.create(:user) }
  let!(:post1) { FactoryGirl.create(:post, user: op_user) }
  let!(:post2) { FactoryGirl.create(:post, user: op_user2) }
  let!(:video1) { FactoryGirl.create(:video, user: op_user, post: post1) }
  let!(:video2) { FactoryGirl.create(:video, user: op_user2, post: post2) }
  let!(:comment1) { FactoryGirl.create(:comment, user: op_user, video: video1) }
  let!(:comment2) { FactoryGirl.create(:comment, user: admin_user, video: video1) }

  scenario "non-OP/non-admin cannot comment on video" do
    user_sign_in(npc_user)
    visit video_path(video1)

    expect(page).to_not have_button("Submit Comment")
  end

  scenario "OP can comment on video" do
    user_sign_in(op_user)
    visit video_path(video1)
    create_comment(comment1)

    expect(page).to have_css("div.comment", text: comment1.body)
    expect(page).to have_css("div.comment", text: comment1.user.username)
    expect(page).to_not have_content("Only OP or admin may comment")
  end

  scenario "admin can comment on video" do
    user_sign_in(admin_user)
    visit video_path(video1)
    create_comment(comment2)

    expect(page).to have_css("div.comment", text: comment2.body)
    expect(page).to have_css("div.comment", text: comment2.user.username)
    expect(page).to_not have_content("Only OP or admin may comment")
  end

  scenario "non-OP/non-admin cannot create video" do
    user_sign_in(npc_user)
    visit video_path(video1)

    expect(page).to_not have_button("Submit Video")
  end

  scenario "OP can delete video" do
    user_sign_in(op_user)
    visit video_path(video1)
    click_link "Delete Video"

    expect(page).to_not have_css("iframe")
  end

  scenario "OP can edit video" do
    user_sign_in(op_user)
    visit video_path(video1)
    click_link "Edit Video"
    fill_in "Tags", with: "Frank Zappa"
    click_button "Submit Video"

    expect(page).to have_content("Video successfully updated!")
  end

  scenario "non-OP/non-admin cannot edit video" do
    user_sign_in(npc_user)
    visit video_path(video1)

    expect(page).to_not have_content("Edit Video")
    expect(page).to_not have_content("Delete Video")
  end

  scenario "admin cannot edit or delete OP video" do
    user_sign_in(admin_user)
    visit video_path(video1)

    expect(page).to_not have_content("Edit Video")
    expect(page).to_not have_content("Delete Video")
  end

  scenario "non-OP/non-admin cannot edit or delete post" do
    user_sign_in(npc_user)
    visit post_path(post1)

    expect(page).to_not have_link("Edit Post")
    expect(page).to_not have_link("Delete Post")
  end

  scenario "OP can edit post" do
    user_sign_in(op_user)
    visit post_path(post1)
    find(".post-show", text: "Edit").click
    fill_in "Title", with: "Mustache"
    click_button "Submit"

    expect(page).to have_content("Mustache")
  end

  scenario "OP can delete post" do
    user_sign_in(op_user)
    visit my_log_users_path
    click_link "Delete"

    expect(page).to_not have_content(post1.title)
    expect(page).to_not have_content(post1.body)
  end

  scenario "admin cannot edit or delete OP post" do
    user_sign_in(admin_user)
    visit post_path(post1)

    expect(page).to_not have_content("Edit Post")
    expect(page).to_not have_content("Delete Post")
  end

  scenario "OP can edit comment" do
    user_sign_in(op_user)
    visit video_path(video1)
    click_link "Edit Comment"
    fill_in "Comment", with: "I have been updated!!!"
    click_button "Submit"

    expect(page).to have_content("I have been updated!!!")
  end

  scenario "OP can delete comment" do
    user_sign_in(op_user)
    visit video_path(video1)
    click_link "Delete Comment"

    expect(page).to_not have_content(comment1.body)
  end

  scenario "non-OP/non-admin cannot edit or delete comment" do
    user_sign_in(npc_user)
    visit video_path(video1)

    expect(page).to_not have_link("Edit Comment")
    expect(page).to_not have_link("Delete Comment")
  end

  scenario "admin cannot edit or delete OP comment" do
    user_sign_in(admin_user2)
    visit video_path(video2)

    expect(page).to_not have_link("Edit Comment")
    expect(page).to_not have_link("Delete Comment")
  end
end
