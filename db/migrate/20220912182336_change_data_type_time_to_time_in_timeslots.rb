class ChangeDataTypeTimeToTimeInTimeslots < ActiveRecord::Migration[7.0]
  def change
    change_column :timeslots, :time, 'time USING CAST(time AS time)'
  end
end
