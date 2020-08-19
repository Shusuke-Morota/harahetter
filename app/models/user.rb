class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  attachment :profile_bg_image
  validates :name, presence: true

  has_many :recipes, dependent: :destroy
  has_many :recipe_images, dependent: :destroy
  accepts_attachments_for :recipe_images, attachment: :image
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def already_favorited?(recipe)
    self.favorites.exists?(recipe_id: recipe.id)
  end

  has_many :comments, dependent: :destroy
end
