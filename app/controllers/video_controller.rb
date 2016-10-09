class VideoController < ApplicationController
  before_action :authorize_user

  def index
    @videos = Video.all
  end

  def show
  end

  def authorize_user
    unless user_signed_in?
      flash[:notice] = "Please sign in or sign up in"\
      " order to view this video and its commentary"
      redirect_to root_path
    end
  end

  private

  def video_params
    # params.require(:video).permit(
    # list attributes here
    # )
  end
end
