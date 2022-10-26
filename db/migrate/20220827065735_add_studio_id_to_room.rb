class AddStudioIdToRoom < ActiveRecord::Migration[7.0]
  def change
    add_reference :rooms, :studio, foreign_key: true
  end
end
