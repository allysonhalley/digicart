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

ActiveRecord::Schema.define(version: 20170626191037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "floors", force: :cascade do |t|
    t.string "name"
    t.text "describe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "alias"
    t.text "describe"
    t.string "bar_code"
    t.bigint "status_id"
    t.bigint "sector_id"
    t.bigint "type_id"
    t.bigint "image_id"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_items_on_image_id"
    t.index ["sector_id"], name: "index_items_on_sector_id"
    t.index ["status_id"], name: "index_items_on_status_id"
    t.index ["type_id"], name: "index_items_on_type_id"
  end

  create_table "movements", force: :cascade do |t|
    t.datetime "datetime"
    t.integer "id_item"
    t.integer "id_status"
    t.integer "id_sector"
    t.integer "id_floor"
    t.float "item_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.string "alias"
    t.text "describe"
    t.bigint "floor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["floor_id"], name: "index_sectors_on_floor_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.text "describe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "amount"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_stocks_on_item_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.text "describe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "images"
  add_foreign_key "items", "sectors"
  add_foreign_key "items", "statuses"
  add_foreign_key "items", "types"
  add_foreign_key "sectors", "floors"
  add_foreign_key "stocks", "items"
end
