class Product < ApplicationRecord
  belongs_to :category
  has_many :orderables
  has_many :carts, through: :orderables
  has_one_attached :main_image
end
