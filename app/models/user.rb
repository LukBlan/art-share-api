class User < ApplicationRecord
  validates :username, presence: true

  has_many :artworks, foreign_key: :artist_id, class_name: "Artwork"
  has_many :artwork_shares, foreign_key: :viewer_id, class_name: "ArtworkShare"
  has_many :shares_artworks, through: :artwork_shares, source: :artwork
end
