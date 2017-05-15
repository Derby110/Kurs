class CreateStilages < ActiveRecord::Migration
  def change
    create_table :stilages do |t|
      t.references :room, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
