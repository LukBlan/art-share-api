class CreateCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :collections do |t|
      t.integer :user_id, null: false
      t.string :name
      t.index :user_id
    end
  end
end
