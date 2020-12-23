class Presence < ActiveHash::Base
  self.data = [
    { id: 1, name: '出席' },
    { id: 2, name: '欠席' }
  ]

  include ActiveHash::Associations
  has_many :attendances
end
