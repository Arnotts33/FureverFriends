class Email < ApplicationRecord
  belongs_to :user
  belongs_to :seller
end
