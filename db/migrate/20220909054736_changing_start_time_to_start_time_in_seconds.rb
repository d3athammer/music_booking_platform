class ChangingStartTimeToStartTimeInSeconds < ActiveRecord::Migration[7.0]
  def change
    rename_column :timeslots, :start_time, :start_time_in_seconds
    add_column :timeslots, :time, :integer
  end
end
