class RenamePricePerHourToTotalPrice < ActiveRecord::Migration[7.0]
  def change
    rename_column :reservations, :price_per_hour, :total_price
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
