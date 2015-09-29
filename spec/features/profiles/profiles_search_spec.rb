require 'rails_helper'

# the js: true forces the test to run Selenium webdriver (firefox)
feature "Search for profiles by framework", js: true do

  # Create user and log in
  background do
    @user = create(:user)
    visit root_path
    sign_up # new_user_session_path

    fill_in("Email", with: @user.email)
    fill_in("Password", with: @user.password)
    click_button "Log in"
    expect(page).to have_content "You have to confirm your email address before continuing." #"Signed in successfully."
    expect(last_email).to have_content @user.email
    open_last_email
    click_first_link_in_email

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
