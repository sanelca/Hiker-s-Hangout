module LikesHelper
  def redirectByLikeableType type, likeData
    if "Comment" == type
      return comments_post_path(likeData)
    else
      return posts_url
    end
  end
end
