# frozen_string_literal: true

class Artwork < ApplicationRecord
  validates :title, :artist_id, :image_url, presence: true
  validates :artist_id, uniqueness: { scope: :title }
  belongs_to :user, foreign_key: :artist_id, class_name: "User"
end
