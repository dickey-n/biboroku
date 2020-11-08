class Museum < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :title
    validates :place
    validates :text
    validates :artist
    validates :image

    validates :prefecture_id, numericality: { other_than: 0 }
    validates :genre_id, numericality: { other_than: 1 }
  end

  has_many :memos, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_users, through: :bookmarks, source: :user

  belongs_to :user
  has_one_attached :image

  def self.search(search)
    if search != ''
      Museum.where('text LIKE(?)', "%#{search}%")
            .or(Museum.where('place LIKE(?)', "%#{search}%"))
            .or(Museum.where('title LIKE(?)', "%#{search}%"))
            .or(Museum.where('artist LIKE(?)', "%#{search}%"))
    else
      Museum.all
    end
  end
end
