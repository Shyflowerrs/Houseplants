class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :full_name
      t.string :billing_address
      t.string :country
      t.string :phone
      t.timestamps
    end
  end
end
