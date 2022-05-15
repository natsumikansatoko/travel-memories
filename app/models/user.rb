class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :memories, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_memories, through: :likes, source: :memory
  
  def liked_by?(memory_id)
    likes.where(memory_id: memory_id).exists?
  end

end
