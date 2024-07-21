class Comment < ApplicationRecord
  validates :artwork_id, :user_id, :body, presence: true

  belongs_to :user
  belongs_to :artwork
end
