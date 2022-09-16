class ChangeStudioToRoomReferenceInEquipment < ActiveRecord::Migration[7.0]
  def change
    remove_reference :equipment, :studio, index: true, foreign_key: true
    add_reference :equipment, :room, index: true, foreign_key: true
  end
end
