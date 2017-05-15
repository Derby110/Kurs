class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :second_name

      t.timestamps null: false
    end
  end
end
