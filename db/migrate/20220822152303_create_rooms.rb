class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :address
      t.integer :price
      t.string :date_availability
      t.string :time_availability
      t.integer :room_size
      t.string :room_type
      t.string :description
      t.integer :total_occupancy

      t.timestamps
    end
  end
end
