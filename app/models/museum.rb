class Museum < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :place
    validates :text
    validates :prefecture_id
    validates :genre_id
    validates :artist
    validates :image
  end

  belongs_to :user
  has_one_attached :image
end
