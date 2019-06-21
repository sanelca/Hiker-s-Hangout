module ApplicationHelper
  def likedOrNot id, type
    return Like.likedOrNot(id, current_user.id, type)
  end

  def friendStatus user, invited, string
    if (user == invited.follower_id || user == invited.followed_id) && !invited.active
      string = "Friend Request Pending"
    end
    if (user == invited.follower_id || user == invited.followed_id) && invited.active
      string = "Friends"
    end
    return string
  end
end
