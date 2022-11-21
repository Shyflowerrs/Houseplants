class AddSale < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :sale, :boolean
  end
end
