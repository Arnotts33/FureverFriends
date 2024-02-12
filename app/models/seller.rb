class Seller < ApplicationRecord
  has_many :breeds, through: :seller_breeds
end
