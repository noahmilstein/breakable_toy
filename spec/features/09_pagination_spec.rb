require "rails_helper"

feature "user" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:users) { FactoryGirl.create_list(:user, 20) }
  let!(:admins) { FactoryGirl.create_list(:user, 20, admin: true) }
  # let!(:videos) { FactoryGirl.create_list(:video, 20) }

  scenario "coach index has pagination, can navigate" do
    user_sign_in(user)
    click_link "Coach Index"
    click_link "3"

    expect(page).to have_content(admins.last.username)
    expect(admins.last.admin).to be(true)
  end

  scenario "trainee index has pagination, can navigate" do
    user_sign_in(admin)
    click_link "Trainee Index"
    click_link "3"

    expect(page).to have_content(users.last.username)
    expect(users.last.admin).to be(false)
  end

  xscenario "video index has pagination, can navigate" do
    user_sign_in(user)
    click_link "Video Index"
    click_link "3"

    # expect(page).to have_content(videos.last.title)
    # expect(users.last.admin).to be(false)
  end
end
