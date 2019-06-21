class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, optional: true
  has_many :likes, as: :likeable, dependent: :destroy

  validates :content, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true
  
  def num_likes
    likes.count
  end

  def liked?
    num_likes > 0
  end
end
