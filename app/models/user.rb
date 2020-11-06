class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :profile, presence: true

  has_many :museums

  has_many :memos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_memos, through: :likes, source: :memo

  mount_uploader :image, ImageUploader

  def liked_by?(memo_id)
    likes.where(memo_id: memo_id).exists?
  end

end
