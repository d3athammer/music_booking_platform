class AddForeignKeysToStudio < ActiveRecord::Migration[7.0]
  def change
    add_reference :studios, :equipment, null: false, foreign_key: true
  end
end
