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

ActiveRecord::Schema.define(version: 20130901090551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drools", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "drool_status"
    t.integer  "plate_id"
  end

  create_table "plates", force: true do |t|
    t.integer  "user_id"
    t.string   "url"
    t.string   "description"
    t.string   "location"
    t.string   "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "drool_count", default: 0
  end

  create_table "plates_tags", force: true do |t|
    t.integer "plate_id"
    t.integer "tag_id"
  end

  add_index "plates_tags", ["plate_id"], name: "index_plates_tags_on_plate_id", using: :btree
  add_index "plates_tags", ["tag_id"], name: "index_plates_tags_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.integer  "uid"
    t.string   "profile_url"
    t.string   "profile_pic"
  end

end
