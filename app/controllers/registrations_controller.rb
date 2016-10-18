class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    @user = User.new(user_params)
    ENV["COACH_EMAILS"].each do |email|
      if @user.email == email
        @user.admin = true
      end
    end
    if @user.save && @user.admin
      flash[:notice] = "Welcome, coach!"
      redirect_to root_path
    elsif
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to root_path
      @user.save && !@user.admin
    else
      flash[:notice] = @user.errors.full_messages.join(", ")
      render :'devise/registrations/new'
    end
  end

  def update
    super
  end

  private

  def user_params
    params.require(:user).permit(
    :first_name,
    :last_name,
    :username,
    :country,
    :state,
    :city,
    :zip,
    :phone,
    :email,
    :password,
    :seeking_coach,
    :accept_email,
    :accept_phone
    )
  end
end
