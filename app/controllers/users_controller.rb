class UsersController < ApplicationController
  before_action :authorize_user, :configure_permitted_parameters, if: :devise_controller?

  def coach_index
    @coaches = User.where(admin: true)
  end

  def trainee_index
    @trainees = User.where(seeking_coach: true)
  end

  def show_profile
    @user = User.find(current_user)
  end

  def show_log
    @user = User.find(current_user)
    @posts = @user.posts
  end

  def destroy
    @user = User.find(params[:id])
    if current_user == @user
      @user.destroy
      flash[:notice] = "User Deleted!"
      redirect_to root_path
    else
      flash[:notice] = "Only owner may delete their profile"
      refresh :show_profile
    end
  end

  protected

  def authorize_user
    unless user_signed_in?
      flash[:notice] = "Please sign in first"
      redirect_to new_user_session_path
    end
  end

  def configure_permitted_parameters
    added_attrs = [
      :first_name,
      :last_name,
      :username,
      :email,
      :phone,
      :country,
      :state,
      :city,
      :zip,
      :seeking_coach,
      :accept_email,
      :accept_phone,
      :remember_me
    ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
