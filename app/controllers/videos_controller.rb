class VideosController < ApplicationController

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @video = Video.new(video_params)
    @video.user_id = @user.id
    @video.post_id = @post.id
    @video.embed_id = @video.url.split('=').last
    if @video.save
      flash[:notice] = "Video successfully created"
      redirect_to user_post_path(@user, @post)
    else
      @errors = @video.errors.full_messages.join(', ')
      flash[:notice] = @errors
      render :'posts/show'
    end
  end

  private

  def video_params
    params.require(:video).permit(
      :title,
      :url,
      :tags,
    )
  end
end
