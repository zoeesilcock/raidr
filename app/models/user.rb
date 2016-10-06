class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :gamertag, presence: true, uniqueness: true
end
