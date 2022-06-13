class Memory < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :district

  belongs_to :user
  belongs_to :genre

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user).exists?
  end

  has_many :memory_images, dependent: :destroy
  accepts_attachments_for :memory_images, attachment: :image

  validates :address, presence: true
  validates :title, presence: true
  validates :body, presence: true
  
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

  def self.search(search)
    if search != ""
      Memory.where('title LIKE(?)', "%#{search}%")
    else
      Memory.includes(:user)
    end
  end
end
