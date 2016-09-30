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

ActiveRecord::Schema.define(version: 20160930171305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "alias"
    t.text     "contents",   default: [],              array: true
    t.integer  "quote_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "layouts", force: :cascade do |t|
    t.string "name"
    t.string "demo_url"
    t.string "layer"
  end

  create_table "quotes", force: :cascade do |t|
    t.string   "name"
    t.string   "background"
    t.string   "background2"
    t.string   "description"
    t.string   "algorithm"
    t.string   "facebook_fields"
    t.integer  "category_id"
    t.integer  "layout_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
