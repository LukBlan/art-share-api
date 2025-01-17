class User < ApplicationRecord
  validates :username, presence: true

  has_many :collections, dependent: :destroy
  has_many :artwork_shares, foreign_key: :viewer_id, class_name: "ArtworkShare", dependent: :destroy
  has_many :artworks, foreign_key: :artist_id, class_name: "Artwork", dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :shares_artworks, through: :artwork_shares, source: :artwork
  has_many :likes
  has_many :liked_comments, through: :likes, source: :likeable, source_type: "Comment"
  has_many :liked_artworks, through: :likes, source: :likeable, source_type: "Artwork"
end
