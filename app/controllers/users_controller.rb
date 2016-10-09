class UsersController < ApplicationController
  before_action :authorize_user, :configure_permitted_parameters, if: :devise_controller?

  def show
    @user = User.find(params[:id])
  end

  def authorize_user
    unless user_signed_in?
      flash[:notice] = "Please sign in first"
      redirect_to unauthenticated_root_path
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [
      :first_name,
      :last_name,
      :username,
      :email,
      :phone,
      :country,
      :city,
      :state,
      :zip,
      :password,
      :password_confirmation,
      :newsletter,
      :remember_me
    ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
