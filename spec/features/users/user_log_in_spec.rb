require 'rails_helper'

feature "Log in" do
  # let!(:user) { create(:user) }
  background do
    visit root_path
  end

  scenario "via Twitter" do
    click_link "Log in"
    expect(page).to have_content("Sign in with Twitter")
    mock_auth_hash

    expect("Successfully authenticated from Twitter account.").to be_present
  end

  scenario "using proper credentials" do
    register_account  # form_helpers.rb
    click_link "Log in"
    fill_in("Email", with: @user.email)
    fill_in("Password", with: @user.password)
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
  end

  scenario "fails using invalid credentials" do
    register_account
    click_link "Log in"
    fill_in("Email", with: @user.email)
    fill_in("Password", with: "incorrect_password")
    click_button "Log in"

    expect(page).to have_content("Invalid email or password")
  end
end
