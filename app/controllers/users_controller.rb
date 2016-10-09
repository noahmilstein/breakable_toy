class UsersController < ApplicationController
  before_action :authorize_user, except: [:new, :create]

  def show
    @user = User.find(params[:id])
  end

  def authorize_user
    unless user_signed_in?
      flash[:notice] = "Please sign in or sign up in"\
      " order to view this video and its commentary"
      redirect_to root_path
    end
  end
  #
  # private
  #
  # def user_params
  #   params.require(:user).permit(
  #     :first_name,
  #     :last_name,
  #     :username,
  #     :email,
  #     :phone,
  #     :country,
  #     :state,
  #     :city,
  #     :zip
  #   )
  # end
end
