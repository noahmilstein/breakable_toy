class RequestAdminMailer < ApplicationMailer
  default from: "coachrwebapp@gmail.com"

  def request_admin(user)
    @user = user
    mail(to: "coachrwebapp@gmail.com" , subject: "#{@user.username} requested admin" )
  end
end
