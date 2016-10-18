require "rails_helper"

RSpec.describe NewUserEmailMailer, type: :mailer do
  describe "notify_user" do
    let!(:user) { FactoryGirl.create(:user) }
    let(:mail) { NewUserEmailMailer.notify_user(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome #{user.username} to coachr!")
      expect(mail.to).to eq(["#{user.email}"])
      expect(mail.from).to eq(["coachrwebapp@gmail.com"])
    end
  end
end
