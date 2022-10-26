class RemoveRoomIdFromStudios < ActiveRecord::Migration[7.0]
  def change
    remove_column :studios, :room_id
  end
end
