class Book < ApplicationRecord
  has_many   :rooms, dependent: :destroy
  # has_many   :comments
  belongs_to :user
  has_one_attached :image
end
