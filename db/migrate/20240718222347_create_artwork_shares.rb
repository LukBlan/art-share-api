class CreateArtworkShares < ActiveRecord::Migration[7.1]
  def change
    create_table :artwork_shares do |t|
      t.integer :viewer_id, null: false
      t.integer :artwork_id, null: false
      t.index :artwork_id
      t.index :viewer_id
      t.index [:artwork_id, :viewer_id], unique: true
    end

    add_foreign_key :artwork_shares, :users, column: :viewer_id
    add_foreign_key :artwork_shares, :artworks, column: :artwork_id
  end
end
