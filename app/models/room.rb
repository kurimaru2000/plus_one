class Room < ApplicationRecord
  # has_many   :room_users
  has_many   :messages, dependent: :destroy
  belongs_to :book
end
