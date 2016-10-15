require 'spec_helper'
require 'rails_helper'

feature 'sign up', %Q{
  As an unauthenticaed user
  I want to sign up
  so that I can track my breakable toy progress
} do

  let(:user) { User.new(first_name: "firstname", last_name: "lastname", username: "username", email: "email@email.com", phone: "(111) 111-1111", password: "password", country: "United States", city: "Boston", state: "MA", zip: "02111") }
  let!(:user2) { FactoryGirl.create(:user) }

  scenario "specify valid and required information" do
    fill_sign_up_form(user)

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario "required information is not supplied" do
    visit new_user_registration_path
    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Username", with: user.username
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
  end

  scenario "password and confirmation don't match" do
    visit new_user_registration_path
    fill_in "First Name", with: user2.first_name
    fill_in "Last Name", with: user2.last_name
    fill_in "Username", with: user2.username
    fill_in "Email", with: user2.email
    fill_in "Phone", with: user2.phone
    fill_in "Password", with: user2.password
    fill_in "Confirm Password", with: "mustache"
    select user2.country, from: "Country"
    select user2.state, from: "State"
    fill_in "City", with: user2.city
    fill_in "Zip", with: user2.zip
    check "Are you seeking a coach?"
    check "Can our coaches email you?"
    check "Can our coaches call or text you?"
    click_button 'Sign Up'

    expect(page).to have_content("Password confirmation doesn't match")
  end
end
