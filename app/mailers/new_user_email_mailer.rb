class NewUserEmailMailer < ApplicationMailer
  default from: "coachrwebapp@gmail.com"

  def notify_user(user)
    @user = user
    mail(to: @user.email , subject: "Welcome #{@user.username} to coachr!" )
  end
end
