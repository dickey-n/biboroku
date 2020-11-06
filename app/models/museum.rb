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
  belongs_to :user
  has_one_attached :image

  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
