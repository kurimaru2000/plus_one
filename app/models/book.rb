class Book < ApplicationRecord
  has_many   :rooms
  # has_many   :comments
  belongs_to :user
  has_one_attached :image

end