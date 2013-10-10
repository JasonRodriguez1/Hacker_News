class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Your comment has been saved."
      redirect_to @comment.route_to_comment
    else
      
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Your comment has been removed."
  end

private

  def comment_params
    params.require(:comment).permit(:text, :commentable_type, :commentable_id)
  end
end

