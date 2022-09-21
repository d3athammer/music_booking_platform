class AddRoomIdToTimeslotReservation < ActiveRecord::Migration[7.0]
  def change
    add_reference :timeslot_reservations, :room, null: true, foreign_key: true
  end
end
