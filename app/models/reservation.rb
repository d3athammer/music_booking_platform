class Reservation < ApplicationRecord
  validates :start_time, :price_per_hour, :num_hours, :status, presence: true
  belongs_to :user
  belongs_to :room
  has_many :timeslots, through: :timeslot_reservation
  # has_many :reviews, dependent: :destroy
  validates :num_hours, :price_per_hour, numericality: { only_integer: true }
end
