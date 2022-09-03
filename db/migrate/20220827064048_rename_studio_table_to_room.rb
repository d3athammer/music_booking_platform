class RenameStudioTableToRoom < ActiveRecord::Migration[7.0]
  def change
    rename_table :studios, :rooms
  end
end
