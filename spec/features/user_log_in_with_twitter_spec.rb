# require 'rails_helper'
#
# feature "Log in via Twitter" do
#   # let!(:user) { create(:user, :with_twitter_account) }
#   create(:user, :with_twitter_account)
#   background do
#     visit root_path
#     click_link "Log in"
#
#     OmniAuth.config.mock_auth[:twitter] = {
#       provider: "twitter",
#       uid: user.twitter_account.uid,
#       credentials: {
#         token: "twitter token"
#       }
#     }
#   end
#
#   scenario "Click log in via Twitter" do
#     # create(:user, :with_twitter_account)
#     click_link "Sign in with Twitter"
#
#     page.should display_flash_message("Successfully authenticated from Twitter account.")
#   end
# end
