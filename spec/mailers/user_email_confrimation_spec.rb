require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  describe "welcome email" do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.welcome_email(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Confirmation instructions")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["notifications@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("To login to the site, just follow this link: http://dev-tracker.herokuapp.com/users/sign_in.")
    end
  end

end
