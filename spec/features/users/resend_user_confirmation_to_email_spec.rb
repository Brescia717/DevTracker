require 'rails_helper'

feature "Resend user confirmation" do
  background do
    visit root_path
  end

  scenario "User didn't receive confirmation instructions and needs them resent" do
    @user = create(:user)
    visit root_path
    sign_up # new_user_session_path

    fill_in("Email", with: @user.email)
    fill_in("Password", with: @user.password)
    click_button "Log in"
    expect(page).to have_content "You have to confirm your email address before continuing."
    click_link "Log in"
    click_link "Didn't receive confirmation instructions?"
    expect(page).to have_content("Resend confirmation instructions")

    fill_in("Email", with: @user.email)
    click_button "Resend confirmation instructions"
    expect(page).to have_content("You will receive an email with instructions
      for how to confirm your email address in a few minutes.")

    expect(last_email).to have_content @user.email
    open_last_email
    click_first_link_in_email

    expect(page).to have_content("Your email address has been successfully confirmed.")
  end

  scenario "User already completed registration and resending registration link results in failure" do
    register_account
    click_link "Log in"
    click_link "Didn't receive confirmation instructions?"
    expect(page).to have_content("Resend confirmation instructions")

    fill_in("Email", with: @user.email)
    click_button "Resend confirmation instructions"
    expect(page).to have_content("1 error prohibited this user from being saved:")
    expect(page).to have_content("Email was already confirmed, please try signing in")
  end
end
