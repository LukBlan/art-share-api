class Comment < ApplicationRecord
  validates :artwork_id, :user_id, :body, presence: true

  belongs_to :user
  belongs_to :artwork
  has_many :likes, as: :likeable
  has_many :users_that_liked, through: :likes, source: :likeable, source_type: "User"
end
