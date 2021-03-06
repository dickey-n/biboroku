class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :museums
  has_many :memos, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :like_memos, through: :likes, source: :memo

  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_museums, through: :bookmarks, source: :museum

  has_one_attached :avatar

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  with_options presence: true do
    validates :name
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'Include both letters and numbers' }
    validates :password_confirmation, format: { with: VALID_PASSWORD_REGEX, message: 'Include both letters and numbers' }
    validates :profile
  end

  def liked_by?(memo_id)
    likes.where(memo_id: memo_id).exists?
  end

  def bookmarked_by?(museum_id)
    bookmarks.where(museum_id: museum_id).exists?
  end
end
