class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :museum
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :memo, presence: true
end
