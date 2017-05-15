class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :schort_name, null: false, unique: true
      t.text :long_name, null: false, unique: true

      t.timestamps null: false
    end
  end
end
