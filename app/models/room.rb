class Room < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }

  VALID_URL_REGEX = /https:\/\/www\.youtube\.com\/watch\?v=([^&]+)/
  validates :youtube_url, presence: true, length: { maximum: 100 }, format: { with: VALID_URL_REGEX }

  has_many :user_rooms
  has_many :users, through: :user_rooms, source: :user
  has_many :messages
end
