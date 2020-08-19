class Recipe < ApplicationRecord
	belongs_to :user
	has_many :recipe_images, dependent: :destroy
	accepts_attachments_for :recipe_images, attachment: :image
	has_many :reviews, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy

	with_options presence: true do
		validates :title
		validates :body
	end
end
