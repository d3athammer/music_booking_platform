class AddColumnToStudio < ActiveRecord::Migration[7.0]
  def change
    add_column :studios, :description, :string
  end
end
