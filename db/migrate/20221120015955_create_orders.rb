class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :shipping_address
      t.string :order_address
      t.string :order_email
      t.date :order_date
      t.string :order_status

      t.timestamps
    end
  end
end
