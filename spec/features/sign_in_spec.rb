require 'spec_helper'
require 'rails_helper'

feature 'sign up', %Q{
  As an unauthenticaed user
  I want to sign up
  so that I can track my breakable toy progress
} do

  # let!(:user1) { FactoryGirl.create(:user) }

# I must specify required fields
# If I miss required fields, I get an error message
# If I fill required fields, I register my account as authenticated user

  scenario "specify valid and required information" do
    visit new_user_session_path
    click_link 'Sign Up'
    # fill_sign_up_form(user1)
    fill_in "First Name", with: 'El Duderino'
    fill_in "Last Name", with: 'Lebowski'
    fill_in "Username", with: 'His_Dudeness'
    fill_in "Email", with: 'email@email.com'
    fill_in "Phone", with: '555-555-5555'
    fill_in "Password", with: 'password'
    fill_in "Confirm Password", with: 'password'
    select "United States", from: "Country"
    select "NY", from: "State"
    fill_in "City", with: 'Some Place'
    fill_in "Zip", with: '12345'
    check "Are you seeking a coach?"
    check "Can our coaches email you?"
    check "Can our coaches call or text you?"
    click_button 'Sign Up'

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario "required information is not supplied" do

  end

  scenario "password and confirmation don't match" do

  end

end
