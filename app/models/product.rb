class Product < ApplicationRecord
  validates :name, :price, :size, :description, :image, :stock, presence: true
  validates :size, numericality: true
  belongs_to :category
end
