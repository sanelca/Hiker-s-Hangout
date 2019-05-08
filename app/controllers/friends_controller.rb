class FriendsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to users_path
	end

  def notifications
    @friendRequests = Relationship.getNotifications(current_user.id)
  end

  def accept
    Relationship.accept(params[:invite_id], current_user.id)
    redirect_to(users_path)
  end

  def list
    @friends = Relationship.getFriends(current_user.id)
  end

  def unfriend
    user = Relationship.unfriend(params[:invite_id], current_user.id)
    redirect_to users_path
  end

end
