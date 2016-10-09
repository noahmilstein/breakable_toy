require "rails_helper"

feature "Prospective user" do
  let(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  context "is unauthenticated" do
    scenario "visits root page and sees sign in prompt" do
      visit unauthenticated_root_path

      expect(page).to have_button("Sign In")
      expect(page).to have_content("Not registered?")
      expect(page).to have_link("Sign Up")
    end

    scenario "user signs up" do
      visit unauthenticated_root_path
      fill_out_sign_up_form(user1)
      visit user_path(user1)

      expect(page).to have_content(user1.first_name)
      expect(page).to have_content(user1.last_name)
      expect(page).to have_content(user1.username)
      expect(page).to have_content(user1.email)
      expect(page).to have_content(user1.phone)
      expect(page).to have_content(user1.country)
      expect(page).to have_content(user1.state)
      expect(page).to have_content(user1.city)
      expect(page).to have_content(user1.zip)
    end
  end

  context "is authenticated" do
    scenario "visits root and sees video index" do
      visit authenticated_root_path
      user_sign_in(user2)

      expect(page).to have_content("Signed in successfully")
      expect(page).to have_content("Video Index")
    end

    scenario "user signs out and signs back in" do
      visit authenticated_root_path
      user_sign_in(user2)
      click_link "Sign Out"
      click_link "Sign In"

      expect(page).to have_content("Signed in successfully")
      expect(page).to have_content("Video Index")
    end
  end
end
