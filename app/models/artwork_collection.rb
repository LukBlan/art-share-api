# frozen_string_literal: true

class ArtworkCollection < ApplicationRecord
  validates :collection_id, :artwork_id, presence: :true
end
