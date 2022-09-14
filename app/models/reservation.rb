class Reservation < ApplicationRecord
  # create_table "reservations", force: :cascade do |t|
  #   t.string "start_time"
  #   t.integer "price_per_hour"
  #   t.integer "duration"
  #   t.boolean "status"
  #   t.bigint "user_id", null: false
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.bigint "timeslot_id"
  #   t.bigint "room_id", null: false
  #   t.date "start_date"
  #   t.string "end_time"
  #   t.date "end_date"

  validates :start_time, :duration, presence: true

  # can be called using reservation.statuses
  # once a reservation has been made, it will show pending, confirmed, and if cancelled, cancelled
  # enum :status, %i[pending confirmed cancelled]
  belongs_to :user
  belongs_to :room
  has_many :timeslot_reservation
  has_many :timeslots, through: :timeslot_reservation
  # has_many :reviews, dependent: :destroy
end

# validates :duration, numericality: { only_integer: true }
