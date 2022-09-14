class CreateStudios < ActiveRecord::Migration[7.0]
  def change
    create_table :studios do |t|
      t.string :address
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
