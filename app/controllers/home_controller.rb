class HomeController < ApplicationController
  def index
    currentUser = current_user.blank?
    unless current_user.nil?
      admin = current_user.admin
    end
    user_json = { "currentUser": currentUser, "admin": admin }
    respond_to do |format|
      format.json { render json: user_json }
      format.html
    end
  end
end
