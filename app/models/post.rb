class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  validates :content, presence: true
  validates :user_id, presence: true

  def num_likes
    likes.count
  end

  def liked?
    num_likes > 0
  end

  def self.allPosts(id)
    idList = [id]
    friends = Relationship.where('follower_id=? OR followed_id=?', id, id).where(active: true)
    friends.each { | friend |
      if friend.follower_id == id
        idList.push(friend.followed_id)
      end
      if friend.followed_id == id
        idList.push(friend.follower_id)
      end
    }
    posts = Post.where(user_id: idList)
    return posts
  end
end
