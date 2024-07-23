class CreateArtworkCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :artwork_collections do |t|
      t.integer :artwork_id, null: false
      t.integer :collection_id, null: false
      t.index :artwork_id
      t.index :collection_id
      t.index [:artwork_id, :collection_id]
    end

    add_foreign_key :artwork_collections, :artworks, column: :artwork_id
    add_foreign_key :artwork_collections, :collections, column: :collection_id
  end
end
