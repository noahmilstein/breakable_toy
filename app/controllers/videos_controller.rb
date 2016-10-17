class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
    @user = @video.user
    @post = @video.post
    @comment = Comment.new
    @comments = @video.comments
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @video = Video.new(video_params)
    @video.user_id = @user.id
    @video.post_id = @post.id
    @video.embed_id = @video.url.split('=').last
    if current_user == @post.user
      if @video.save
        flash[:notice] = "Video successfully created"
        redirect_to user_post_path(@user, @post)
      else
        @errors = @video.errors.full_messages.join(', ')
        flash[:notice] = @errors
        render :'posts/show'
      end
    else
      flash[:notice] = "Only OP can upload videos"
      render :'posts/show'
    end
  end

  def edit
    @video = Video.find(params[:id])
    @post = @video.post
  end

  def update
    @video = Video.find(params[:id])
    @post = Post.find(params[:id])
    @video.update_attributes(video_params)
    if current_user == @video.user
      if @video.save
        flash[:notice] = "Video successfully updated!"
        redirect_to post_video_path(@post, @video)
      else
        fail_update(@video)
      end
    else
      flash[:notice] = "Only OP can edit video"
      refresh :edit
    end
  end

  def destroy
    @video = Video.find(params[:id])
    if current_user == @video.user
      @post = @video.post
      @user = @video.user
      @video.destroy
      redirect_to user_post_path(@user, @post)
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
