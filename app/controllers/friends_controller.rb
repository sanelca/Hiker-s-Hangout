class FriendsController < ApplicationController
  include FriendsHelper
  def create
		@sentInvite = params[:invite_id]
    @user = current_user.id
		@invite = Friend.new
    @invite.user_id = @user
    @invite.friend_id = @sentInvite
		if @invite.save
			redirect_to(users_path)
		else
      redirect_to(root_path)
		end
	end

  def notifications
    @friendRequests = getNotifications
  end

  def accept
    @friend = Friend.find_by("user_id = ? AND friend_id = ?", params[:invite_id] , current_user.id)
    Friend.update(@friend.id, :accepted => true)
    redirect_to(root_path)
  end  
end
