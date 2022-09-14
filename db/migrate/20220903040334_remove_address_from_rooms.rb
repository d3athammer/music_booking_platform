class RemoveAddressFromRooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :address
  end
end
