class Breed < ApplicationRecord
  has_one_attached :photo
  has_many :user_breeds, dependent: :destroy
end
