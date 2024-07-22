class AddFavoriteToArtwork < ActiveRecord::Migration[7.1]
  def change
    add_column :artworks, :favorite, :boolean
    Artwork.update_all(favorite: false)
    change_column_null :artworks, :favorite, false
  end
end
