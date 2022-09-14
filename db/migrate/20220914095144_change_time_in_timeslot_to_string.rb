class ChangeTimeInTimeslotToString < ActiveRecord::Migration[7.0]
  def change
    change_column :timeslots, :time, :string
  end
end
