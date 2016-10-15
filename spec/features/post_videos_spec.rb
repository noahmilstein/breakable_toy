require 'rails_helper'

feature 'user has a log' do

  # before :each do
  #   user_sign_in(user1)
  # end

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:post1) { FactoryGirl.create(:post, user: user1) }
  let!(:video1) { FactoryGirl.create(:video, user: user1, post: post1) }
  let!(:post2) { FactoryGirl.create(:post, user: user1) }
  let!(:post3) { FactoryGirl.create(:post, user: user1) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:post4) { FactoryGirl.create(:post, user: user2) }
  let(:post5) { FactoryGirl.build(:post) }

  scenario 'user submits new video in post' do
    user_sign_in(user1)
    click_link "My Log"
    click_link "Add new entry"
    create_post(post1)

    expect(page).to have_content(post1.title)
    expect(page).to have_content(post1.date)
    expect(page).to have_content(post1.body)
    expect(page).to have_content(post1.tags)
  end

  scenario 'user adds videos to post' do
    user_sign_in(user1)
    visit user_post_path(user1, post1)
    fill_in "Video Url", with: "https://www.youtube.com/watch?v=h2q6v0AChyw"
    click_button "Submit"
    expect(page).to have_content(video1.title)
    # page.should have_css("iframe[class='html5 video']")
  end

  scenario 'user inspects post, sees index of post videos' do
    # user_sign_in(user1)
    # click_link "My Profile"
    # click_link post1.title
    #
    # expect(page).to have_content(post1)
  end
end

# movie GET    /movies/:id(.:format)                        movies#show
#  user GET    /users/:id(.:format)                         users#show
#       GET    /movies/:movie_id/reviews/:id(.:format)      reviews#show
#       GET    /movies/:id(.:format)                        movies#show
# review_vote GET    /reviews/:review_id/votes/:id(.:format)      votes#show
# review GET    /reviews/:id(.:format)                       reviews#show
