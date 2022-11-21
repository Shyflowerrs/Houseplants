class Product < ApplicationRecord
  validates :name, :price, :size, :description, :image, :stock, :category_id, presence: true
  validates :size, numericality: true
end
