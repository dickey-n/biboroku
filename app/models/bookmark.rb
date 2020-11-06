class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :museum
  validates :user_id, uniqueness: { scope: :museum_id }
end
