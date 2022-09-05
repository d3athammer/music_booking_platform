class AddDateToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :date, :datetime
  end
end
