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

ActiveRecord::Schema[7.0].define(version: 2022_11_23_094324) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "featured_images", force: :cascade do |t|
    t.text "image_url"
    t.text "categorry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.text "image_url"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "username"
    t.text "image_url"
    t.text "password_digest"
    t.boolean "approved", default: false
    t.text "role", default: "user", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
