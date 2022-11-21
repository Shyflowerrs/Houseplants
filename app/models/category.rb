class Category < ApplicationRecord
  validates :name, :description, :size, presence: true
  has_many :products
end
