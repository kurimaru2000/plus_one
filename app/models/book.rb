class Book < ApplicationRecord
  has_many   :rooms, dependent: :destroy
  # has_many   :comments
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :image
  end

  validates :image, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }

end
