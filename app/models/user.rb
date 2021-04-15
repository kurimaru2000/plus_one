class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  has_many :comments
  has_many :messages
  has_many :room_users
  has_many :messages

  with_options presence: true do
    validates :nickname
  end
end
