class RemoveTimeAndDateAvailabilityFromRooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :date_availability
    remove_column :rooms, :time_availability
  end
end
