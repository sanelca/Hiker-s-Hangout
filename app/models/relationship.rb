class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true

  def self.invited(id)
    return @invited = Relationship.where('follower_id=? OR followed_id=?', id, id)
  end

  def self.getNotifications(id)
    users = []
    notifications = Relationship.where('followed_id=? AND active=?', id, false)
    notifications.each { | notification |
      user = User.find_by(id: notification.follower_id)
      users.push(user)
    }
    return users
  end

  def self.accept(id, current)
    friend = Relationship.find_by("follower_id = ? AND followed_id = ?", id , current)
    Relationship.update(friend.id, :active => true)
  end

  def self.getFriends(id)
    friends = Relationship.where('follower_id=? OR followed_id=?', id, id).where(:active => true)
    friendList = []
    friends.each { | friend |
      if friend.follower_id == id
        user = User.find(friend.followed_id)
      end
      if friend.followed_id == id
        user = User.find(friend.follower_id)
      end
      friendList.push(user)
    }
    return friendList
  end

  def self.unfriend(id, current)
    friendsKeys = Relationship.where('follower_id=? OR followed_id=?', id, id).where(active: true)
    friendsKeys.each { |friend|
      if friend.follower_id == current.to_i || friend.followed_id == current.to_i
        Relationship.delete(friend)
      end
    }
  end

  def self.findFriendsByUserid(id)
    friendList = []
    friends = Relationship.where('follower_id=? OR followed_id=?', id, id).where(:active => true)
    friends.each { | friend |
      if friend.follower_id == id
        user = User.find(friend.followed_id)
      end
      if friend.followed_id == id
        user = User.find(friend.follower_id)
      end
      friendList.push(user)
    }
    return friendList
  end
end
