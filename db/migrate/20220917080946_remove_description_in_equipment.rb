class RemoveDescriptionInEquipment < ActiveRecord::Migration[7.0]
  def change
    remove_column :equipment, :description
  end
end
