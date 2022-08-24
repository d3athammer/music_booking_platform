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

ActiveRecord::Schema[7.0].define(version: 2022_08_24_115834) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.string "type"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "studio_id", null: false
    t.index ["studio_id"], name: "index_equipment_on_studio_id"
  end

  create_table "media", force: :cascade do |t|
    t.bigint "studio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_media_on_studio_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "price_per_hour"
    t.integer "num_hours"
    t.boolean "status"
    t.bigint "user_id", null: false
    t.bigint "studio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_reservations_on_studio_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comment"
    t.integer "rating"
    t.bigint "reservation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_reviews_on_reservation_id"
  end

  create_table "studios", force: :cascade do |t|
    t.string "address"
    t.integer "price"
    t.string "date_availability"
    t.string "time_availability"
    t.integer "room_size"
    t.string "room_type"
    t.string "description"
    t.integer "total_occupancy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "studio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_wishlists_on_studio_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "equipment", "studios"
  add_foreign_key "media", "studios"
  add_foreign_key "reservations", "studios"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "reservations"
  add_foreign_key "wishlists", "studios"
  add_foreign_key "wishlists", "users"
end
