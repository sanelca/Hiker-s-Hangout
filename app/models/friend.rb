class Friend < ApplicationRecord
  has_many :friends, foreign_key: "user_id", dependent: :destroy
end
