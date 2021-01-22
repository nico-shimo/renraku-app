class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :child_name
  end

  has_many :attendances
  has_many :prints
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
end
