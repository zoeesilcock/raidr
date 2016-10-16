class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :date, presence: true
end
