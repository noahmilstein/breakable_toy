class HomeController < ApplicationController
  def index
    currentUser = current_user.blank?
    unless current_user.nil?
      admin = current_user.admin
      userName = current_user.username
      avatar =  URI("#{current_user.image}")
      if !avatar.to_s.include?("http")
        avatar = ""
      else
        avatar = avatar.to_s
      end
    end
    user_json = { "currentUser": currentUser, "admin": admin, "userName": userName, "avatar": avatar }
    respond_to do |format|
      format.json { render json: user_json }
      format.html
    end
  end

  def about
  end
end
