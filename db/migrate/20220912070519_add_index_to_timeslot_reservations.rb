class AddIndexToTimeslotReservations < ActiveRecord::Migration[7.0]
  def change
    rename_column :timeslot_reservations, :timeslots_id, :timeslot_id
    rename_column :timeslot_reservations, :reservations_id, :reservation_id
    add_index :timeslot_reservations, %i[timeslot_id reservation_id], unique: true
  end
end
