class RenameTotalPriceColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :Total_price, :total_price
  end
end
