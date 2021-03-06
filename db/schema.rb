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

ActiveRecord::Schema.define(version: 20210319020724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_brands_on_slug"
  end

  create_table "counties", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.float "mark_up"
    t.float "tax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_counties_on_slug"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "county_id"
    t.bigint "sale_id"
    t.float "price"
    t.float "tax"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["county_id"], name: "index_items_on_county_id"
    t.index ["product_id"], name: "index_items_on_product_id"
    t.index ["sale_id"], name: "index_items_on_sale_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.float "cost_price"
    t.bigint "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["slug"], name: "index_products_on_slug"
  end

  create_table "sales", force: :cascade do |t|
    t.float "sold_price"
    t.float "tax"
    t.float "profit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
