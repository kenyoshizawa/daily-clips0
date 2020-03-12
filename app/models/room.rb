class Room < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :youtube_url, presence: true, length: { maximum: 100 }

  has_many :user_rooms
  has_many :users, through: :user_rooms, source: :user
  has_many :messages
end
