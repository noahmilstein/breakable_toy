class VideosController < ApplicationController

  def index
    if params[:tag]
      @videos = Video.tagged_with(params[:tag]).page(params[:page]).per_page(10).order(created_at: "desc")
      @comments = Comment.all
      @users = User.all
    else
      @videos = Video.all.page(params[:page]).per_page(10).order(created_at: "desc")
      @comments = Comment.all
      @users = User.all
    end

    # video_user_hash = {}
    # @videos.each do |video|
    #
    # end

    # @videos = @videos.map { |video| video.user_id = video.user.username }

    # @videos = @videos.map do |video|
    #   video.user_id = User.where(id: [video.user.id])
    # end

    videos_json = { "videos": @videos, "current_user": current_user, "comments": @comments }
    respond_to do |format|
      format.html
      format.json { render json: videos_json }
    end
  end

  def show
    @video = Video.find(params[:id])
    @user = @video.user
    @post = @video.post
    @comment = Comment.new
    @comments = @video.comments
    comment = @comments.first
    # binding.pry
    comment_json = { "comment": comment }
    respond_to do |format|
      format.json { render json: comment_json }
      format.html
    end
    # user_json = { "user": user }
    # respond_to do |format|
    #   format.html
    #   format.json { render json: user_json }
    # end
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @video = Video.new(video_params)
    @video.user_id = @user.id
    @video.post_id = @post.id
    @video.embed_id = @video.url.split("=").last
    if current_user == @post.user
      if @video.save
        flash[:notice] = "Video successfully created"
        redirect_to user_post_path(@user, @post)
      else
        @errors = @video.errors.full_messages.join(", ")
        flash[:notice] = @errors
        render :"posts/show"
      end
    else
      flash[:notice] = "Only OP can upload videos"
      render :"posts/show"
    end
  end

  def edit
    @video = Video.find(params[:id])
    @post = @video.post
  end

  def update
    @video = Video.find(params[:id])
    @post = @video.post
    @video.update_attributes(video_params)
    if current_user == @video.user
      if @video.save
        flash[:notice] = "Video successfully updated!"
        redirect_to post_video_path(@post, @video)
      else
        flash[:notice] = "Video was not updated."
        @errors = @video.errors.full_messages.join(", ")
        flash[:alert] = @errors
        render action: "edit"
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
      :tag_list,
    )
  end
end
