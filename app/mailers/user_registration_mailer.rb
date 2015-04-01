class UserRegistrationMailer < ApplicationMailer
  def confirm(user)
    @user = user
    mail(from: 'noreply@unifiedpost-test.com', to: @user.email, subject: 'Confirm user')
  end
end
