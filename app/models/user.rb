class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  attachment :profile_bg_image

  has_many :recipes, dependent: :destroy
  has_many :recipe_images, dependent: :destroy
  accepts_attachments_for :recipe_images, attachment: :image

  validates :name, presence: true
end
