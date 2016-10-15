class VideosController < ApplicationController
  # before_action :authorize_user
  # def index
  # end

  # def new
  #   @video = Video.new
  #   @post = Post.find(params[:post_id])
  # end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @video = Video.new(video_params)
    # binding.pry
    @video.user_id = @user.id
    @video.post_id = @post.id
    # binding.pry
    if @video.save
      @video.embed_id  = @video.url.split('=').last
      # if @video.tags.include?(',')
      #   @video.tags = @video.tags.split(',')
      # else
      #   @video.tags.to_a
      # end
      flash[:notice] = "Video successfully created"
      redirect_to user_post_path(@user, @post)
    else
      @errors = @video.errors.full_messages.join(', ')
      flash[:notice] = @errors
      render :'posts/show'
    end
  end

  # t.string :title, null: false
  # t.string :url, null: false
  # t.string :embed_id, null: false
  # t.string :tags

  private

  def video_params
    params.require(:video).permit(
      :title,
      :url,
      :tags,
    )
  end
end
