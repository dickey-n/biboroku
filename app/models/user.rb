class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :profile
  end

  has_many :museums
  has_many :memos, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_memos, through: :likes, source: :memo

  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_museums, through: :bookmarks, source: :museum

  mount_uploader :image, ImageUploader

  def liked_by?(memo_id)
    likes.where(memo_id: memo_id).exists?
  end

  def bookmarked_by?(museum_id)
    bookmarks.where(museum_id: museum_id).exists?
  end
end
