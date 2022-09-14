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

ActiveRecord::Schema[7.0].define(version: 2022_09_14_102001) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "blockoutdatetimes", force: :cascade do |t|
    t.string "day_of_week"
    t.string "day"
    t.bigint "timeslot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timeslot_id"], name: "index_blockoutdatetimes_on_timeslot_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "studio_id", null: false
    t.integer "equipment_type"
    t.index ["studio_id"], name: "index_equipment_on_studio_id"
  end

  create_table "media", force: :cascade do |t|
    t.bigint "studio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_media_on_studio_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "start_time"
    t.integer "price_per_hour"
    t.integer "duration"
    t.boolean "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "timeslot_id"
    t.bigint "room_id", null: false
    t.date "start_date"
    t.string "end_time"
    t.date "end_date"
    t.index ["room_id"], name: "index_reservations_on_room_id"
    t.index ["timeslot_id"], name: "index_reservations_on_timeslot_id"
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

  create_table "rooms", force: :cascade do |t|
    t.integer "price"
    t.integer "room_size"
    t.string "room_type"
    t.string "description"
    t.integer "total_occupancy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.bigint "studio_id"
    t.string "room_name"
    t.index ["studio_id"], name: "index_rooms_on_studio_id"
  end

  create_table "studio_media", force: :cascade do |t|
    t.bigint "studio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_studio_media_on_studio_id"
  end

  create_table "studios", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "user_id"
    t.integer "postal"
    t.string "description"
    t.index ["user_id"], name: "index_studios_on_user_id"
  end

  create_table "timeslot_reservations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_date"
    t.bigint "reservation_id", null: false
    t.bigint "timeslot_id", null: false
    t.date "end_date"
    t.index ["reservation_id"], name: "index_timeslot_reservations_on_reservation_id"
    t.index ["timeslot_id", "reservation_id"], name: "index_timeslot_reservations_on_timeslot_id_and_reservation_id", unique: true
    t.index ["timeslot_id"], name: "index_timeslot_reservations_on_timeslot_id"
  end

  create_table "timeslots", force: :cascade do |t|
    t.integer "start_time_in_seconds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "blockoutdatetimes", "timeslots"
  add_foreign_key "equipment", "studios"
  add_foreign_key "media", "studios"
  add_foreign_key "reservations", "rooms"
  add_foreign_key "reservations", "timeslots"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "reservations"
  add_foreign_key "rooms", "studios"
  add_foreign_key "studio_media", "studios"
  add_foreign_key "studios", "users"
  add_foreign_key "timeslot_reservations", "reservations"
  add_foreign_key "timeslot_reservations", "timeslots"
  add_foreign_key "wishlists", "studios"
  add_foreign_key "wishlists", "users"
end
