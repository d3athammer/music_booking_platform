class RemoveEndDateAndChangeStartDateToDateInTimeSlotReservations < ActiveRecord::Migration[7.0]
  def change
    rename_column :timeslot_reservations, :start_date, :date
    remove_column :timeslot_reservations, :end_date
  end
end
