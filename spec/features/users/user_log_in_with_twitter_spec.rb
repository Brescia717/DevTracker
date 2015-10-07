require 'rails_helper'

feature "Log in via Twitter" do
  # let!(:user) { create(:user, :with_twitter_account) }
  # let!(:user_account) { create(:user_account) }

  background do
    visit root_path
  end

  scenario "Click log in via Twitter" do
    mock_auth_hash                           # from support/omniauth_macros.rb
    click_link "Log in"

    expect("Successfully authenticated from Twitter account.").to be_present
  end
end
