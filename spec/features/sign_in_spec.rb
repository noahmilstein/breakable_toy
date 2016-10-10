require 'spec_helper'
require 'rails_helper'

feature 'sign up', %Q{
  As an unauthenticaed user
  I want to sign up
  so that I can track my breakable toy progress
} do

  let(:user) { User.new(first_name: "firstname", last_name: "lastname", username: "username", email: "email@email.com", phone: "(111) 111-1111", password: "password", country: "United States", city: "Boston", state: "MA", zip: "02111") }

  scenario "specify valid and required information" do
    visit root_path
    click_link 'Sign Up'
    fill_sign_up_form(user)
    click_button 'Sign Up'

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario "required information is not supplied" do
    visit root_path
    click_link 'Sign Up'
    fill_in "First Name", with: "steve"
    fill_in "Last Name", with: "steve"
    fill_in "Username", with: "steve"
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
  end

  scenario "password and confirmation don't match" do
    visit root_path
    click_link 'Sign Up'
    fill_in "First Name", with: "steve"
    fill_in "Last Name", with: "steve"
    fill_in "Username", with: "steve"
    fill_in "Email", with: "steve@steve.com"
    fill_in "Phone", with: "555-555-5555"
    fill_in "Password", with: "password"
    fill_in "Confirm Password", with: "mustache"
    select "United States", from: "Country"
    select "NY", from: "State"
    fill_in "City", with: "Boston"
    fill_in "Zip", with: "12345"
    check "Are you seeking a coach?"
    check "Can our coaches email you?"
    check "Can our coaches call or text you?"
    click_button 'Sign Up'

    expect(page).to have_content("Password confirmation doesn't match")
  end
end
