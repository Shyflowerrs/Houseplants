class AddOrderSalesTax < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :sales_tax, :decimal
  end
end
