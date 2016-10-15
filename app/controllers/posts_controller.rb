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
