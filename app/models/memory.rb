class Memory < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :district

  belongs_to :user
  belongs_to :genre

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  attachment :image

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

end
