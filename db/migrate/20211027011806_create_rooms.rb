class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :room_name
      t.text :introduction
      t.integer :price
      t.string :adress

      t.timestamps
    end
  end
end
