require 'rails_helper'

feature "Visit profile" do
  background do
    visit root_path
    register_account
    @profile = create(:profile, user_id: @user.id)

    click_link "Log in"
    fill_in("Email", with: @user.email)
    fill_in("Password", with: @user.password)
    click_button "Log in"
  end

  scenario "Visit your profile via 'My Profile' link" do
    click_link "My Account"
    click_link "view-profile-btn"
    expect(page).to have_content("#{@user.name}'s Profile")
    expect(page).to have_content("This is an example summary.")
  end

  scenario "Visit your profile via 'Developers by framework' link" do
    click_link "vp-#{@user.id}"
    expect(page).to have_content("This is an example summary.")
  end
end
