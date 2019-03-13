class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable, dependent: :destroy

  validates :content, presence: true
  validates_presence_of :user, :post

  def num_likes
    likes.count
  end

  def liked?
    num_likes > 0
  end
end
