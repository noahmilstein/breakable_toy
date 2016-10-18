require "rails_helper"

feature "user" do

  let!(:user1) { FactoryGirl.create(:user, seeking_coach: true, accept_email: true, accept_phone: true) }
  let!(:user2) { FactoryGirl.create(:user, seeking_coach: true, accept_email: true, accept_phone: true) }
  let!(:user3) { FactoryGirl.create(:user, seeking_coach: true, accept_email: true, accept_phone: true) }
  let(:unlisted_admin) { FactoryGirl.create(:user, email: "boston.strength.coach@gmail.com") }
  let!(:admin_user1) { FactoryGirl.create(:user, admin: true) }
  let!(:admin_user2) { FactoryGirl.create(:user, admin: true) }
  let!(:admin_user3) { FactoryGirl.create(:user, admin: true) }

  scenario "is trainee, can see coach index in nav bar" do
    user_sign_in(user1)
    click_link "Coach Index"

    expect(page).to have_content(admin_user1.username)
    expect(page).to have_content(admin_user2.country)
    expect(page).to have_content(admin_user3.state)
    expect(page).to have_content(admin_user1.city)
    expect(page).to have_button("Send Email")
    expect(page).to have_button("Send Text")
  end

  scenario "is coach, sees users seeking coaches as index in nav bar" do
    user_sign_in(admin_user1)
    click_link "Trainee Index"

    expect(page).to have_content(user1.username)
    expect(page).to have_content(user2.state)
    expect(page).to have_content(user3.city)
    expect(page).to have_content(user1.country)
    expect(page).to have_button("Send Email")
    expect(page).to have_button("Send Text")
  end

  scenario "is coach, signs up, switches admin boolean" do
    fill_sign_up_form(unlisted_admin)

    expect(unlisted_admin.admin).to be(true)
  end

  xscenario "is coach, signs up, email not in const, requests admin status" do
    user_sign_in(user1)
    visit my_profile_users_path
    click_button "Request Admin Status"

    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario "user is admin nav bar reads coach" do
  end

  scenario "user is not admin nav bar does not read coach" do
  end

end
