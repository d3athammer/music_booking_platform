class AddStartDateAndEndDateToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :end_date, :date
    rename_column :reservations, :date, :start_date
  end
end
