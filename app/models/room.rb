class Room < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  has_many :room_users
  has_many :users, through: :room_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  
  validates :name, presence: true
end
