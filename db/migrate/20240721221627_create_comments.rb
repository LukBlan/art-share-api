class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :artwork_id, null: false
      t.text :body, null: false
      t.index :user_id
      t.index :artwork_id
    end

    add_foreign_key :comments, :users, column: :user_id
    add_foreign_key :comments, :artworks, column: :artwork_id
  end
end
