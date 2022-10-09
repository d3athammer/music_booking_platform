class EquipmentTypeToStringInEquipment < ActiveRecord::Migration[7.0]
  def change
    change_column :equipment, :equipment_type, :string
  end
end
