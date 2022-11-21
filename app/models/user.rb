class User < ApplicationRecord
  validates :username, :email, :password, :full_name, :billing_address, :country, :phone,
            presence: true
end
