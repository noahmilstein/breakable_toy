require "rails_helper"
require "faker"

feature "user" do
  let!(:user1) { FactoryGirl.create(:user) }
  before :each do
    20.times do
      user = FactoryGirl.create(:user)
      video = FactoryGirl.create(:video, user: user)
    end
  end

  before :each do
    user_sign_in(user1)
  end

  scenario "sees tags on videos of video index" do
    visit videos_path
    Video.all.each do |video|
      expect(page).to have_content(video.tag_list)
    end
  end

  xscenario "can sort video index by tag" do
    visit videos_path
    tags = Video.all.first.tag_list.first
    tag = find_all("a", text: tags)[0].text
    click_link tag
  end
end
