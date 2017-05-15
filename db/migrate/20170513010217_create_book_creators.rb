class CreateBookCreators < ActiveRecord::Migration
  def change
    create_table :book_creators do |t|
      t.references :book, index: true, foreign_key: true, null: false
      t.references :creator, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
