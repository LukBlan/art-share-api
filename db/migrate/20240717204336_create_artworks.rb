class CreateArtworks < ActiveRecord::Migration[7.1]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :artist_id, null: false
    end

    add_foreign_key :artworks, :users, column: :artist_id
    add_index :artworks, [:artist_id, :title], unique: true
  end
end
