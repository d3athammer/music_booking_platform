class Timeslot < ApplicationRecord
  has_many :timeslot_reservations
  has_many :reservations, through: :timeslot_reservation
end
