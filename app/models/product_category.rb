class ProductCategory < ApplicationRecord
  validates :product_id, :category_id, presence: true
end
