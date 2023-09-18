class Declaration < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :declaration
    validates :comment
  end
end
