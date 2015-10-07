module FormHelpers
  def submit_form
    find('input[name="commit"]').click
  end

  def sign_up
    find(:xpath, "//a[@href='/users/sign_in']").click
  end

  def register_account
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
  end
end
