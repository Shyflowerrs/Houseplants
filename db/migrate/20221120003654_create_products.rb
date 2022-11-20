class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :size
      t.string :description
      t.string :image
      t.integer :stock
      t.integer :category_id

      t.timestamps
    end
  end
end
