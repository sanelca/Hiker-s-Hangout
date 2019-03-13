class UsersController < ApplicationController
  include FriendsHelper

  def index
    @users = User.where.not(id: current_user.id)
    @invited = Friend.where('user_id=? OR friend_id=?', current_user.id, current_user.id)
  end
  
end
