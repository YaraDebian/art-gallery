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

ActiveRecord::Schema[8.0].define(version: 2025_03_24_204352) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "art_movements", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.text "biography"
    t.date "birth_date"
    t.date "death_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artworks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "year"
    t.string "image_url"
    t.bigint "artist_id", null: false
    t.bigint "art_movement_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [ "art_movement_id" ], name: "index_artworks_on_art_movement_id"
    t.index [ "artist_id" ], name: "index_artworks_on_artist_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sharings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "gallery_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [ "gallery_id" ], name: "index_sharings_on_gallery_id"
    t.index [ "user_id" ], name: "index_sharings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "artworks", "art_movements"
  add_foreign_key "artworks", "artists"
  add_foreign_key "galleries", "users", column: "id"
  add_foreign_key "sharings", "galleries"
  add_foreign_key "sharings", "users"
end
