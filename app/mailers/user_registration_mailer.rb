class UserRegistrationMailer < ApplicationMailer
  def confirm(user)
    @user = user
    mail(to: @user.email, subject: 'Confirm user')
  end
end
