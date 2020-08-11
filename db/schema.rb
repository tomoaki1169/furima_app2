# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_07_073234) do

  create_table "adresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "prefecture", null: false
    t.string "post_code", null: false
    t.string "municipality", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_adresses_on_user_id"
  end

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", null: false
    t.string "ancesty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "credit_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "card_company", null: false
    t.string "card_yaer", null: false
    t.string "card_manth", null: false
    t.string "card_pass", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "image"
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_images_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "derivery_fee"
    t.string "size"
    t.string "status"
    t.string "data"
    t.string "area"
    t.string "introduction"
    t.string "sale_status"
    t.bigint "user_id"
    t.bigint "brand_id"
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "family_name", null: false
    t.string "first_name", null: false
    t.string "first_name_kana", null: false
    t.string "birth_year", null: false
    t.string "birth_month", null: false
    t.string "birth_day", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "adresses", "users"
  add_foreign_key "credit_cards", "users"
  add_foreign_key "profiles", "users"
end
