class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: { maximum: 10 }

  has_secure_password

  has_many :user_rooms
  has_many :rooms, through: :user_rooms, source: :room
  has_many :messages

end
