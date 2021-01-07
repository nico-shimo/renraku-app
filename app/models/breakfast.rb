class Breakfast < ActiveHash::Base
  self.data = [
    { id: 1, name: '沢山食べた' },
    { id: 2, name: '少しだけ食べた' },
    { id: 3, name: '全然食べなかった' }
  ]

  include ActiveHash::Associations
  has_many :attendances
end
