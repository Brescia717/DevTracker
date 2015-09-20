module FormHelpers
  def submit_form
    find('input[name="commit"]').click
  end

  def sign_up
    find(:xpath, "//a[@href='/users/sign_in']").click
  end
end
