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

ActiveRecord::Schema[7.1].define(version: 2024_05_08_222851) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "moto_brands", force: :cascade do |t|
    t.string "name", null: false
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moto_models", force: :cascade do |t|
    t.string "name", null: false
    t.string "nickname"
    t.string "wiki_url_ru"
    t.string "wiki_url_en"
    t.integer "production_start"
    t.integer "production_end"
    t.string "market"
    t.bigint "moto_brand_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["moto_brand_id"], name: "index_moto_models_on_moto_brand_id"
  end

  create_table "motorcycles", force: :cascade do |t|
    t.bigint "moto_model_id", null: false
    t.bigint "moto_brand_id", null: false
    t.integer "year", null: false
    t.string "color", null: false
    t.string "vin"
    t.string "plate_number"
    t.string "name"
    t.boolean "visible", default: false, null: false
    t.bigint "visible_to_users", default: [], array: true
    t.bigint "current_owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["current_owner_id"], name: "index_motorcycles_on_current_owner_id"
    t.index ["moto_brand_id"], name: "index_motorcycles_on_moto_brand_id"
    t.index ["moto_model_id"], name: "index_motorcycles_on_moto_model_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "displayname"
    t.string "password_digest"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "moto_models", "moto_brands"
  add_foreign_key "motorcycles", "moto_brands"
  add_foreign_key "motorcycles", "moto_models"
  add_foreign_key "motorcycles", "users", column: "current_owner_id"
end
