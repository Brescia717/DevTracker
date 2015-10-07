require 'rails_helper'

feature "User can register their account" do
  scenario "successfully" do
    register_account  # support/form_helpers.rb

    expect(page).to have_content("Your email address has been successfully confirmed.")
  end
end
