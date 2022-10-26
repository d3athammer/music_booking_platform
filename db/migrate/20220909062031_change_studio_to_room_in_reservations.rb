class ChangeStudioToRoomInReservations < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :studio_id
  end
end
