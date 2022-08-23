class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :start_date
      t.string :end_date
      t.string :start_time
      t.string :end_time
      t.integer :price_per_hour
      t.integer :num_hours
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :studio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
