class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
    :sign_up,
    keys: [
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
      :accept_phone
      ])
  end
end
