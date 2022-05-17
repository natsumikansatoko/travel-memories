class Memory < ApplicationRecord
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

  geocoded_by :address
  after_validation :geocode

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

end
