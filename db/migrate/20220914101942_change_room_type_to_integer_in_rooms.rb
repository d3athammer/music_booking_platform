class ChangeRoomTypeToIntegerInRooms < ActiveRecord::Migration[7.0]
  def change
    # change_column :rooms, :room_type, 'integer USING CAST(room_type AS integer)'
  end
end
