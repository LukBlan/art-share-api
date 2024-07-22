class AddFavoriteToSharedArtworks < ActiveRecord::Migration[7.1]
  def change
    add_column :artwork_shares, :favorite, :boolean
    ArtworkShare.update_all(favorite: false)
    change_column_null :artwork_shares, :favorite, false
  end
end
