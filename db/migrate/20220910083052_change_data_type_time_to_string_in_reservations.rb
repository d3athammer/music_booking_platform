class ChangeDataTypeTimeToStringInReservations < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :start_time, :string
  end
end
