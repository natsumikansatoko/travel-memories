class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :memory

  validates_uniqueness_of :memory_id, scope: :user_id
end
