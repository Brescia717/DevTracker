require 'rails_helper'

feature "User password reset" do
  background do
    register_account
  end

  scenario "User forgot password and needs to reset it" do
    expect(page).to have_content("Sign up")
    expect(page).to have_content("Log in")
    click_link "Log in"
    click_link "Forgot your password?"
    expect(page).to have_button("Send me reset password instructions")

    fill_in("Email", with: @user.email)
    click_button "Send me reset password instructions"
    expect(page).to have_content("You will receive an email with instructions on
      how to reset your password in a few minutes.")

    expect(last_email).to have_content @user.email
    open_last_email
    click_first_link_in_email

    expect(page).to have_content("Change your password")
    fill_in("New password", with: "password")
    fill_in("Confirm new password", with: "password")
    click_button "Change my password"

    expect(page).to have_content("Your password has been changed successfully.
      You are now signed in.")
  end
end
