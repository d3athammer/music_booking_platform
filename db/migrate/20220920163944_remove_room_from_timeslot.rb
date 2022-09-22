class RemoveRoomFromTimeslot < ActiveRecord::Migration[7.0]
  def change
    remove_reference :timeslots, :room, foreign_key: true
  end
end
