class UserMailer < ApplicationMailer
  default from: 'mailertest0222@gmail.com'
  def new_registration(user)
    @user = user
    mail(to: @user.email, subject: "New User Signup: #{@user.email}")
  end
end
