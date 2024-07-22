class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.references :likeable, polymorphic: true
    end

    add_foreign_key :likes, :users, column: :user_id
  end
end
