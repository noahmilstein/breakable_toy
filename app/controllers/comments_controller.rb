class CommentsController < ApplicationController

  def create
    @user = current_user
    @video = Video.find(params[:video_id])
    @comment = Comment.new(body: params[:comment][:body])
    @comment.user = @user # this should instead be strong params
    @comment.video = @video # this should instead be strong params
    # @comment = Comment.new(comment_params) # why isn't this working?
    @post = @video.post
    if @comment.save
      flash[:notice] = "Comment successfully created"
      redirect_to post_video_path(@post, @video)
    else
      @errors = @comment.errors.full_messages.join(', ')
      flash[:notice] = @errors
      render :'videos/show'
    end
  end

  private

  def comment_params # this method is not working
    params.require(:comment).permit(
      :body,
      :user,
      :video
    )
  end
end
