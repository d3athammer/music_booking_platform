class DescriptionToTextInStudio < ActiveRecord::Migration[7.0]
  def change
    change_column :studios, :description, :text
  end
end
