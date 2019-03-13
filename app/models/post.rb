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
end
