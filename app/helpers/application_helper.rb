module ApplicationHelper
  def likedOrNot id, type
    return Like.likedOrNot(id, current_user.id, type)
  end
end
