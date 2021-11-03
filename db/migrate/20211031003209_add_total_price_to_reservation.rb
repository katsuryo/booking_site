class AddTotalPriceToReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :Total_price, :integer
  end
end
