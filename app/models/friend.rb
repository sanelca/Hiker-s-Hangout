class Friend < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :user_id, presence: true
  validates :friend_id, presence: true

  def self.invited(id)
    return @invited = Friend.where('user_id=? OR friend_id=?', id, id)
  end
end
