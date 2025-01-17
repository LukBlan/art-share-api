# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_23_194603) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artwork_collections", force: :cascade do |t|
    t.integer "artwork_id", null: false
    t.integer "collection_id", null: false
    t.index ["artwork_id", "collection_id"], name: "index_artwork_collections_on_artwork_id_and_collection_id"
    t.index ["artwork_id"], name: "index_artwork_collections_on_artwork_id"
    t.index ["collection_id"], name: "index_artwork_collections_on_collection_id"
  end

  create_table "artwork_shares", force: :cascade do |t|
    t.integer "viewer_id", null: false
    t.integer "artwork_id", null: false
    t.boolean "favorite", null: false
    t.index ["artwork_id", "viewer_id"], name: "index_artwork_shares_on_artwork_id_and_viewer_id", unique: true
    t.index ["artwork_id"], name: "index_artwork_shares_on_artwork_id"
    t.index ["viewer_id"], name: "index_artwork_shares_on_viewer_id"
  end

  create_table "artworks", force: :cascade do |t|
    t.string "title", null: false
    t.string "image_url", null: false
    t.integer "artist_id", null: false
    t.boolean "favorite", null: false
    t.index ["artist_id", "title"], name: "index_artworks_on_artist_id_and_title", unique: true
  end

  create_table "collections", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "artwork_id", null: false
    t.text "body", null: false
    t.index ["artwork_id"], name: "index_comments_on_artwork_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.string "likeable_type"
    t.bigint "likeable_id"
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
  end

  add_foreign_key "artwork_collections", "artworks"
  add_foreign_key "artwork_collections", "collections"
  add_foreign_key "artwork_shares", "artworks"
  add_foreign_key "artwork_shares", "users", column: "viewer_id"
  add_foreign_key "artworks", "users", column: "artist_id"
  add_foreign_key "comments", "artworks"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "users"
end
