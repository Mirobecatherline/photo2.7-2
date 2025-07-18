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

ActiveRecord::Schema[7.0].define(version: 2025_03_20_162407) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "photo_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_id"], name: "index_comments_on_photo_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "featured_images", force: :cascade do |t|
    t.text "image_url"
    t.text "categorry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "url"
    t.integer "assigned_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "edited", default: false
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "photo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_id"], name: "index_likes_on_photo_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "url"
    t.integer "assigned_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "email"
    t.string "photo_url"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "photos"
  add_foreign_key "comments", "users"
  add_foreign_key "images", "users"
  add_foreign_key "likes", "photos"
  add_foreign_key "likes", "users"
  add_foreign_key "photos", "users"
end
