class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :gamertag, presence: true, uniqueness: true

  has_many :group_memberships
  has_many :groups, through: :group_memberships

  def current_group
    groups.first
  end
end
