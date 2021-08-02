class CreateHobbies < ActiveRecord::Migration[5.2]
  def change
    create_table :hobbies do |t|
      t.integer :user_id
      t.integer :genre_id
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
