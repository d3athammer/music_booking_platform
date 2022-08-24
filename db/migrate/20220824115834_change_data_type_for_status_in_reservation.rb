class ChangeDataTypeForStatusInReservation < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :status, 'boolean USING CAST(status AS boolean)'
  end
end
