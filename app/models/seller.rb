class Seller < ApplicationRecord
  has_many :breed_sellers, dependent: :destroy
  has_many :breeds, through: :breed_sellers
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  scope :by_breed, ->(breed_name) {  joins(:breeds).where(breeds: { name: breed_name }) }

end
