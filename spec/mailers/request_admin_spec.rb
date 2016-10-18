require "rails_helper"

RSpec.describe RequestAdminMailer, type: :mailer do
  describe "request_admin" do
    let!(:user) { FactoryGirl.create(:user) }
    let(:mail) { RequestAdminMailer.request_admin(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("#{user.username} requested admin")
      expect(mail.to).to eq(["coachrwebapp@gmail.com"])
      expect(mail.from).to eq(["coachrwebapp@gmail.com"])
    end
  end
end
