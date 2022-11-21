class Order < ApplicationRecord
  validates :customer_id, :shipping_address, :order_address, :order_email, :order_date, :order_status, presence: true
end
