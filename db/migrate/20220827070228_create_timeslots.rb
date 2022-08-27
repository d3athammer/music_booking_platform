class CreateTimeslots < ActiveRecord::Migration[7.0]
  def change
    create_table :timeslots do |t|
      t.integer :start_time

      t.timestamps
    end
  end
end
