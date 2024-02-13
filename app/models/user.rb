class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_breeds
  has_many :chatrooms
  has_many :messages
  has_many :breeds, through: :user_breeds
  has_one :profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
