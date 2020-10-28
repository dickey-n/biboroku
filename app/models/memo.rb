class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :museum

  validates :memo, presence: true
end
