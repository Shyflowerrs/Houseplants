class Category < ApplicationRecord
  validates :name, :description, :size, presence: true
end
