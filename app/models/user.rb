class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  has_secure_password

  has_many :user_rooms
  has_many :rooms, through: :user_rooms, source: :room
  has_many :messages
end
