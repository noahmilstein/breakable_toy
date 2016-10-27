class VideosController < ApplicationController
  before_action :authenticate_user, :configure_permitted_parameters, if: :devise_controller?

  def index
    if params[:tag]
      @videos = Video.tagged_with(params[:tag]).page(params[:page]).per_page(10).order(created_at: "desc")
    else
      @videos = Video.all.page(params[:page]).per_page(10).order(created_at: "desc")
    end
  end

  def search
    @results = Video.tagged_with(params[:search]) if params[:search]
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
    @video.embed_id = @video.url.split("=").last
    tags = params[:video][:tag_list][0].split(',')
    tags.each do |tag|
      @video.tag_list.add(tag)
    end
    if current_user == @post.user
      if @video.save
        flash[:notice] = "Video successfully created"
        redirect_to post_path(@post)
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
    # #video.tag_list.compact.join(', ') #try this
  end

  def update
    @video = Video.find(params[:id])
    @post = @video.post
    @video.update_attributes(video_params)
    if current_user == @video.user
      if @video.save
        flash[:notice] = "Video successfully updated!"
        redirect_to video_path(@video)
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
      redirect_to post_path(@post)
    end
  end

  private

  def video_params
    params.require(:video).permit(
      :title,
      :url,
      tag_list: []
    )
  end
end
