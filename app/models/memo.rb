class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :museum

  validates :text, presence: true
end
