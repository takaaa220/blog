class User < ApplicationRecord
  has_secure_password

  validates :status, presence: true
  validates :password, presence: true, length: { minimum: 8 }, password: true
  validates :email, presence: true, uniqueness: true, email: true
  has_many :posts, dependent: :destroy

  enum status: %i(user admin)
end
