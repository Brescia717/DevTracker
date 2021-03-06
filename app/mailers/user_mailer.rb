class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://dev-tracker.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Confirmation instructions')
  end
end
