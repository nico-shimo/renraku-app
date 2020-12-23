class Temperture < ActiveHash::Base
  self.data = [
    { id: 1, name: '平熱' },
    { id: 2, name: '37.0~37.4度' },
    { id: 3, name: '37.5度以上' }
  ]

  include ActiveHash::Associations
  has_many :attendances
end
