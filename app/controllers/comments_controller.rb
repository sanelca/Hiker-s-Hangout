class CommentsController < ApplicationController
  include CommentsHelper

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    if @comment.update(comment_params)
      redirect_to comments_post_path(@comment.post_id)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    if @comment.destroy
      redirect_to comments_post_path(@comment.post_id)
    else
      redirect_to comments_post_path(@comment.post_id)
    end
  end

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
