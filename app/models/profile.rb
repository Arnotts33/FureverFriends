class Profile < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one_attached :profile_picture
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
