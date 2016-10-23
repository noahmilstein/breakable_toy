class UsersController < ApplicationController
  before_action :authenticate_user, :configure_permitted_parameters, if: :devise_controller?

  def coach_index
    @coaches = User.where(admin: true).page(params[:page]).per_page(10)
  end

  def request_admin
    @user = current_user
    RequestAdminMailer.request_admin(@user).deliver
  end

  def trainee_index
    @trainees = User.where(seeking_coach: true).page(params[:page]).per_page(10)
  end

  def show_profile
    @user = User.find(current_user.id)
  end

  def show_log
    @user = User.find(current_user.id)
    @posts = @user.posts.page(params[:page]).per_page(10)
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
