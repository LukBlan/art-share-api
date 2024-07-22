class Artwork < ApplicationRecord
  validates :title, :artist_id, :image_url, :favorite, presence: true
  validates :artist_id, uniqueness: { scope: :title }

  has_many :shares, foreign_key: :artwork_id, class_name: "ArtworkShare", dependent: :destroy
  belongs_to :user, foreign_key: :artist_id, class_name: "User"
  has_many :comments, dependent: :destroy
  has_many :viewers, through: :shares, source: :viewer
  has_many :likes, as: :likeable
  has_many :users_that_liked, through: :likes, source: :likeable, source_type: "Artwork"
end
