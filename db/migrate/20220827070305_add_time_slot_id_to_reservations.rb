class AddTimeSlotIdToReservations < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :timeslot, foreign_key: true
  end
end
