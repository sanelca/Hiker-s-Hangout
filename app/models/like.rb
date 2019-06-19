class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true
  belongs_to :user

  validates_presence_of :user, :likeable
  validates_uniqueness_of :user_id, scope: [:likeable_id, :likeable_type]

  def self.likedOrNot(id, user, type)
    return  Like.find_by('user_id=? AND likeable_id=? AND likeable_type=?', user, id, type)
  end
end
