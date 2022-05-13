class Memory < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  attachment :image

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :districts
end
