class AddStudioToEquipment < ActiveRecord::Migration[7.0]
  def change
    add_reference :equipment, :studio, null: false, foreign_key: true
  end
end
