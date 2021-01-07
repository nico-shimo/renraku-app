class Attendance < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :presence
  belongs_to :breakfast
  belongs_to :bath
  belongs_to :temperture

  with_options numericality: { message: 'Select' } do
    validates :presence_id
    validates :breakfast_id
    validates :bath_id
    validates :temperture_id
  end

  belongs_to :user
end
