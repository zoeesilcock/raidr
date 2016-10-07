class Group < ApplicationRecord
  scope :public_groups, -> { where(public: true) }

  validates :title, presence: true
end
