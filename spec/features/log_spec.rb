require 'rails_helper'

feature 'user has a log' do

  let!(:user) { FactoryGirl.create(:user) }

  # let!(:user) { User.create(first_name: "firstname", last_name: "lastname", username: "username", email: "email@email.com", phone: "(111) 111-1111", password: "password", country: "United States", city: "Boston", state: "MA", zip: "02111") }

  scenario 'if user signed in, sees log entries and new entry form' do
    visit root_path
    click_link 'Sign In'
    user_sign_in(user)
    click_button 'Submit'

    # <%= f.date_select :date, :order => [:day, :month, :year] %>
    expect(page).to have_content("Training Log")
  end

# authenticated user
# all log entries (posts) on home index
# visible logs (posts) unique to user (belongs to user)
# new log entry form visible on home index (new post)

end
