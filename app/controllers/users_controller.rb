class UsersController < ApplicationController
  before_action :authorize_user, except: [:new, :create]

  def new
    @user = User.new
    @states = User::STATES
  end

  def authorize_user
    unless user_signed_in?
      flash[:notice] = "Please sign in or sign up in"\
      " order to view this video and its commentary"
      redirect_to root_path
    end
  end

  private

  def user_params
    # params.require(:user).permit(
    # list attributes here
    # )
  end
end
