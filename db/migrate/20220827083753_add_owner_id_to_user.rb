class AddOwnerIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :studios, :user, foreign_key: true
  end
end
