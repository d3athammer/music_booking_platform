class ChangeDescriptionToTextInRoom < ActiveRecord::Migration[7.0]
  def change
    change_column :rooms, :description, :text
  end
end
