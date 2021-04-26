class Room < ApplicationRecord
  # has_many   :room_users
  has_many   :messages, dependent: :destroy
  belongs_to :book

  with_options presence: true do
    validates :name
    validates :capacity, format: { with: /\A[0-9]+\z/ }
    validates :goal
  end
end
