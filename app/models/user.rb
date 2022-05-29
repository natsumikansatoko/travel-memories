class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :district
  has_many :memories, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_memories, through: :likes, source: :memory
  has_many :favorites, dependent: :destroy

  def liked_by?(memory_id)
    likes.where(memory_id: memory_id).exists?
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end

  def active_for_authentication
    super && (is_active == true)
  end
end
