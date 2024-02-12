class Breed < ApplicationRecord
  has_one_attached :photo
  has_many :user_breeds, dependent: :destroy
  has_many :breed_sellers, dependent: :destroy
  has_many :sellers, through: :breed_sellers
end
