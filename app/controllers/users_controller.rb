class UsersController < ApplicationController
  include FriendsHelper
  include UsersHelper
  def index
    @users = User.where.not(id: current_user.id)
    @invited = Friend.where('user_id=? OR friend_id=?', current_user.id, current_user.id)
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.reorder("created_at DESC")
    @friends = getFriendsByID(@user.id)
	end

  def edit
    @user = User.find_by(id: current_user.id)
  end

  def update
    @user = User.find_by(id: current_user.id)
    if @user.update(user_params)
      redirect_to(users_path)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
			redirect_to users_path
		else
			render 'edit'
		end
  end
end
