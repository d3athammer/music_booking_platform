class Reservation < ApplicationRecord
  validates :start_time, :duration, presence: true
  belongs_to :user
  belongs_to :room
  has_many :timeslot_reservation
  has_many :timeslots, through: :timeslot_reservation
  # has_many :reviews, dependent: :destroy
end

# validates :duration, numericality: { only_integer: true }
