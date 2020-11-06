class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :museum
  validates_uniqueness_of :museum_id, scope: :user_id
end
