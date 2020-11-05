class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :museum

  validates :memo, presence: true

  has_many :likes
  has_many :liked_users, through: :likes, source: :user
end
