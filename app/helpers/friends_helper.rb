module FriendsHelper
  def getNotifications
    users = []
    notifications = Friend.where('friend_id=? AND accepted=?', current_user.id, false)
    notifications.each { | notification |
      user = User.find_by(id: notification.user_id)
      users.push(user)
    }
    return users
  end

  def getFriendsByID(id)
    friendList = []
    friends = Friend.where('user_id=? OR friend_id=?', id, id).where(:accepted => true)
    friends.each { | friend |
      if friend.user_id == id
        user = User.find(friend.friend_id)
      end
      if friend.friend_id == id
        user = User.find(friend.user_id)
      end
      friendList.push(user)
    }
    return friendList
  end
end
