class RemoveEndTimeFromReservations < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :end_time
  end
end
