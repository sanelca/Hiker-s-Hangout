module PostsHelper
  def post_params
    params.require(:post).permit(:content)
  end

  def allPosts
    idList = [current_user.id]
    friends = Friend.where('user_id=? OR friend_id=?', current_user.id, current_user.id).where(accepted: true)
    friends.each { | friend |
      if friend.user_id == current_user.id
        idList.push(friend.friend_id)
      end
      if friend.friend_id == current_user.id
        idList.push(friend.user_id)
      end
    }
    posts = Post.where(user_id: idList)
    return posts
  end
end
