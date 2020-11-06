class Like < ApplicationRecord
  belongs_to :user
  belongs_to :memo
  validates_uniqueness_of :memo_id, scope: :user_id
end
