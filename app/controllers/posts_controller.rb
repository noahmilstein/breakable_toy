class PostsController < ApplicationController

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.user = @user
    if @post.save
      flash[:notice] = "Log entry submitted"
      redirect_to user_post_path(@user, @post)
    else
      flash[:notice] = @post.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @videos = @post.videos
    @video = Video.new
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user == @post.user
      @post.destroy
      redirect_to my_log_users_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  #
  # def update
  #   @video = Video.find(params[:id])
  #   @post = Post.find(params[:id])
  #   @video.update_attributes(video_params)
  #   if current_user == @video.user
  #     if @video.save
  #       flash[:notice] = "Video successfully updated!"
  #       redirect_to post_video_path(@post, @video)
  #     else
  #       fail_update(@video)
  #     end
  #   else
  #     flash[:notice] = "Only OP can edit video"
  #     refresh :edit
  #   end
  # end

  private

  def post_params
    params.require(:post).permit(
    :title,
    :date,
    :body,
    :tags,
    :user
    )
  end

end
