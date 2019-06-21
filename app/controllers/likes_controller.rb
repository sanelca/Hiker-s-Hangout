class LikesController < ApplicationController
  include LikesHelper
  def create
    @like = Like.new
    @like.likeable_type = params[:type]
    @like.likeable_id = params[:likeable_id]
    @like.user_id = current_user.id
    if @like.save
      redirect_to(redirectByLikeableType(@like.likeable_type, @like.likeable_id))
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    if @like.user_id == current_user.id
      @like.destroy
      redirect_to(redirectByLikeableType(@like.likeable_type, @like.likeable_id))
    end
  end
end
