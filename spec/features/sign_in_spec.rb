require 'spec_helper'
require 'rails_helper'

feature 'sign up', %Q{
  As an unauthenticaed user
  I want to sign up
  so that I can track my breakable toy progress
} do

  let(:user) { FactoryGirl.create(:user) }

# I must specify required fields
# If I miss required fields, I get an error message
# If I fill required fields, I register my account as authenticated user

  scenario "specify valid and required information" do
    visit new_user_session_path
    click_link 'Sign Up'
    fill_sign_up_form(user)
    click_button 'Sign Up'

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario "required information is not supplied" do

  end

  scenario "password and confirmation don't match" do

  end

end
