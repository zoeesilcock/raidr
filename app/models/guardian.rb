class Guardian < ApplicationRecord
  belongs_to :user
  enum guardian_class: [:warlock, :hunter, :titan]
  validates :guardian_class, presence: true
end
