class Like < ApplicationRecord
  belongs_to :memory
  belongs_to :user
  
  validates_uniqueness_of :memory_id, scope: :user_id
end
