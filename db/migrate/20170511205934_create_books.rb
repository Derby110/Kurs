class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text :book_name, null: false
      t.integer :part, null: false
      t.string :isbn_index, null: false
      t.integer :publick_year, null: false
      t.integer :number_of_have, null: false
      t.integer :schelf_number, null: false
      t.references :stilage, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
