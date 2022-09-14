class CreateBlockoutdatetimes < ActiveRecord::Migration[7.0]
  def change
    create_table :blockoutdatetimes do |t|
      t.string :day_of_week
      t.string :day
      t.references :timeslot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
