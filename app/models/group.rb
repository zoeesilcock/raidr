class Group < ApplicationRecord
  scope :public_groups, -> { where(public: true) }

  validates :title, presence: true, uniqueness: true

  has_many :group_memberships
  has_many :users, through: :group_memberships
end
