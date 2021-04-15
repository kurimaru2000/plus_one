class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string  :name, null: false
      t.integer :capacity, null: false
      t.string  :goal, null: false
      t.references :book, foreign_key: true
      t.timestamps
    end
  end
end
