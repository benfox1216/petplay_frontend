# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200530223635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pet_plays", force: :cascade do |t|
    t.string "title"
    t.string "pet_players"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false

  create_table "pets", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "species"
    t.integer "age"
    t.string "breed"
    t.string "size"
    t.string "about_me"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "image"
    t.string "google_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "zipcode", default: "00000"
  end

  add_foreign_key "pets", "users"
end
