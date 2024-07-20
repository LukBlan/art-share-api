class Artwork < ApplicationRecord
  validates :title, :artist_id, :image_url, presence: true
  validates :artist_id, uniqueness: { scope: :title }

  has_many :shares, foreign_key: :artwork_id, class_name: "ArtworkShare", dependent: :destroy
  belongs_to :user, foreign_key: :artist_id, class_name: "User"
  has_many :viewers, through: :shares, source: :viewer
end
