class CommentsController < ApplicationController
  before_action :authenticate_user, :configure_permitted_parameters, if: :devise_controller?

  def create
    @user = current_user
    @video = Video.find(params[:video_id])
    @comment = Comment.new(comment_params)
    @comment.user = @user
    @comment.video = @video
    @post = @video.post
    if current_user == @video.user || current_user.admin
      if @comment.save
        flash[:notice] = "Comment successfully created"
        redirect_to video_path(@video)
      else
        @errors = @comment.errors.full_messages.join(", ")
        flash[:notice] = @errors
        render :"videos/show"
      end
    else
      flash[:notice] = "Only OP or admin may comment"
      render :"videos/show"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @video = @comment.video
  end

  def update
    @comment = Comment.find(params[:id])
    @video = @comment.video
    @comment.update_attributes(comment_params)
    if current_user == @comment.user
      if @comment.save
        flash[:notice] = "Comment successfully updated!"
        redirect_to video_path(@video)
      else
        flash[:notice] = "Comment was not updated."
        @errors = @video.errors.full_messages.join(", ")
        flash[:alert] = @errors
        render action: "edit"
      end
    else
      flash[:notice] = "Only OP can edit comment"
      refresh :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user == @comment.user
      @video = @comment.video
      @post = @video.post
      @comment.destroy
      redirect_to video_path(@video)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body,
    )
  end
end
