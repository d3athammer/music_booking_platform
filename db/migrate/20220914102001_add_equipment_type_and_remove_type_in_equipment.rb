class AddEquipmentTypeAndRemoveTypeInEquipment < ActiveRecord::Migration[7.0]
  def change
    add_column :equipment, :equipment_type, :integer
    remove_column :equipment, :type
  end
end
