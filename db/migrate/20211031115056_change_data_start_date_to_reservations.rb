class ChangeDataStartDateToReservations < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :start_date, :date
    change_column :reservations, :end_date, :date
  end
end
