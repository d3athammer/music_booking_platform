class AddUserReferenceToRooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :rooms, :user, index: true
  end
end
