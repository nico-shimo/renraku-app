class Bath < ActiveHash::Base
  self.data = [
    { id: 1, name: '入った' },
    { id: 2, name: '入らなかった' }
  ]

  include ActiveHash::Associations
  has_many :attendances
end
