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

ActiveRecord::Schema.define(version: 20170505201512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "alias"
    t.string   "describe"
    t.string   "bar_code"
    t.integer  "type"
    t.integer  "sector_id"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sector_id"], name: "index_items_on_sector_id", using: :btree
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.string   "alias"
    t.string   "describe"
    t.integer  "floor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "sectors"
end
