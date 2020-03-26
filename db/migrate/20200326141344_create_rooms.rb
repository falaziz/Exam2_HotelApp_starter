class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.boolean :booked
      t.integer :room_number
      t.string :room_type

      t.timestamps
    end
  end
end
