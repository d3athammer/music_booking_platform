class AddStartDateEndDateToTimeslotReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :timeslot_reservations, :end_date, :date
    rename_column :timeslot_reservations, :date, :start_date
  end
end
