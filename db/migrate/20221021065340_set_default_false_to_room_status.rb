class SetDefaultFalseToRoomStatus < ActiveRecord::Migration[7.0]
  def up
    change_column_default :reservations, :status, true
  end

  def down
    change_column_default :reservations, :status, nil
  end
end
