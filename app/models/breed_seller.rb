class BreedSeller < ApplicationRecord
  belongs_to :breed
  belongs_to :seller
end
