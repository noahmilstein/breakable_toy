class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [
      :first_name,
      :last_name,
      :username,
      :email,
      :phone,
      :image,
      :state,
      :city,
      :zip,
      :seeking_coach,
      :accept_email,
      :accept_phone,
      :remember_me,
      :password,
      :password_confirmation,
      :current_password
    ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
