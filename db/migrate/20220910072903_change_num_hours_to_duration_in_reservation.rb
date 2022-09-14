class ChangeNumHoursToDurationInReservation < ActiveRecord::Migration[7.0]
  def change
    rename_column :reservations, :num_hours, :duration
  end
end
