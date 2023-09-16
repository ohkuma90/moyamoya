class Worry < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :text
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :title
  end
end
