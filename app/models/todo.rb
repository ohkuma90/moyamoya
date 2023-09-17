class Todo < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :memo
    validates :priority_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  # アクティブハッシュのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
