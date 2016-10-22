require "rails_helper"

feature "profile photo" do
  scenario "user uploads a profile photo" do
    visit root_path
    click_link "Sign Up"

    visit new_user_registration_path
    fill_in "First Name", with: "Steve"
    fill_in "Last Name", with: "Steve"
    fill_in "Username", with: "Steve"
    fill_in "Email", with: "Steve@Steve.com"
    fill_in "Phone", with: "666-666-6666"
    attach_file "Add Avatar", "#{Rails.root}/spec/support/Dr_John_Zoidberg.png"
    fill_in "Password", with: "password"
    fill_in "Confirm Password", with: "password"
    select "NY", from: "State"
    fill_in "City", with: "Steve"
    fill_in "Zip", with: "12345"
    check "Are you seeking a coach?"
    check "Can our coaches email you?"
    check "Can our coaches call or text you?"
    click_button "Sign Up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_xpath("//img")
    expect(page).to have_css("img")
  end
end
