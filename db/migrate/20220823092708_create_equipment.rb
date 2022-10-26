class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :brand
      t.string :type
      t.string :description

      t.timestamps
    end
  end
end
