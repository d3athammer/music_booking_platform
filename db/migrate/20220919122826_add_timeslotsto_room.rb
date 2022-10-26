class AddTimeslotstoRoom < ActiveRecord::Migration[7.0]
  def change
    add_reference :timeslots, :room, foreign_key: true
  end
end
