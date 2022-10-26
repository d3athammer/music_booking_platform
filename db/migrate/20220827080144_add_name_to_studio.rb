class AddNameToStudio < ActiveRecord::Migration[7.0]
  def change
    add_column :studios, :name, :string
  end
end
