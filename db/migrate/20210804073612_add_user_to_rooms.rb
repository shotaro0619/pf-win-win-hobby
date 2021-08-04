class AddUserToRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :rooms, :user, foreign_key: true
  end
end
