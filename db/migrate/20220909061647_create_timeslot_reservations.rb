class CreateTimeslotReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :timeslot_reservations do |t|
      t.timestamps
      t.date :date
      t.references :reservations, null: false, foreign_key: true
      t.references :timeslots, null: false, foreign_key: true
    end
  end
end
