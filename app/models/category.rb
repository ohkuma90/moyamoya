class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '人間関係のこと' },
    { id: 3, name: 'お金のこと' },
    { id: 4, name: '健康のこと' },
    { id: 5, name: '将来のこと' },
  ]

  include ActiveHash::Associations
  has_many :worries
end