class OrderDetail < ApplicationRecord
  validates :order_id, :product_id, :price, :quantity, presence: true
  validates :price, numericality: true
end
