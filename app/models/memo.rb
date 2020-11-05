class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :museum
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  validates :memo, presence: true
  validates_uniqueness_of :memo_id, scope: :user_id
end
