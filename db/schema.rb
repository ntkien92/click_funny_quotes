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

ActiveRecord::Schema.define(version: 20161224082306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string  "alias"
    t.integer "resource_id"
    t.integer "quote_id"
    t.jsonb   "contents",    default: {}
    t.index ["alias", "quote_id"], name: "index_answers_on_alias_and_quote_id", unique: true, using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "en_content"
    t.string "vn_content"
    t.index ["name"], name: "index_categories_on_name", unique: true, using: :btree
  end

  create_table "layouts", force: :cascade do |t|
    t.string "name"
    t.string "demo_url"
    t.index ["name"], name: "index_layouts_on_name", unique: true, using: :btree
  end

  create_table "main_quotes", force: :cascade do |t|
    t.string  "name"
    t.string  "algorithm"
    t.string  "facebook_fields"
    t.integer "category_id"
    t.integer "layout_id"
    t.string  "color",           default: [], array: true
    t.integer "background_url",  default: [], array: true
    t.index ["name"], name: "index_main_quotes_on_name", unique: true, using: :btree
  end

  create_table "quotes", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "language"
    t.integer  "main_quote_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "slug"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.string "data"
  end

end
