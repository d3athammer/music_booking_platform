class TimeslotReservation < ApplicationRecord
  # To make sure reservations are reserved and no 1 else can book it
  belongs_to :reservation
  belongs_to :timeslot
end
