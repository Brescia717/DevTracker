require 'rails_helper'

# the js: true forces the test to run Selenium webdriver (firefox)
feature "Search for profiles by framework", js: true do

  # Create user and log in
  background do
    register_account  # support/form_helpers.rb

    click_link "Log in"
    fill_in("Email", with: @user.email)
    fill_in("Password", with: @user.password)
    click_button "Log in"
  end

  scenario "Clicking 'Search' shows results based on user input" do
    profile = create(:profile, user_id: @user.id)
    visit root_path
    fill_in("search", with: profile.framework)
    click_on "Search"
    expect(page).to have_content "#{profile.framework} devs:"
  end
end
