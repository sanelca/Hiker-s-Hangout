class CommentsController < ApplicationController
  include CommentsHelper
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = params[:id]
    if @comment.save
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end
end
