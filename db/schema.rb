# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150329153133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string   "title",                       null: false
    t.text     "description"
    t.string   "vanity_url"
    t.integer  "creator_id"
    t.string   "password"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "read_privilege",  default: 1
    t.integer  "write_privilege", default: 1
  end

  add_index "albums", ["creator_id"], name: "index_albums_on_creator_id", using: :btree

  create_table "albums_users", force: :cascade do |t|
    t.integer  "album_id"
    t.integer  "user_id"
    t.integer  "read_privilege",  default: 1
    t.integer  "write_privilege", default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collaborators_albums", force: :cascade do |t|
    t.integer  "album_id",        null: false
    t.integer  "collaborator_id", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "collaborators_albums", ["album_id"], name: "index_collaborators_albums_on_album_id", using: :btree
  add_index "collaborators_albums", ["collaborator_id"], name: "index_collaborators_albums_on_collaborator_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.boolean  "favorite",   default: true
    t.integer  "album_id",                  null: false
    t.integer  "user_id",                   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "favorites", ["album_id"], name: "index_favorites_on_album_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.text     "caption"
    t.string   "location"
    t.integer  "album_id",   null: false
    t.integer  "owner_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["album_id"], name: "index_images_on_album_id", using: :btree
  add_index "images", ["owner_id"], name: "index_images_on_owner_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",      null: false
    t.string   "email",         null: false
    t.string   "password_hash", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
