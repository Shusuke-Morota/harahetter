class Recipe < ApplicationRecord
	belongs_to :user
	has_many :recipe_images, dependent: :destroy
	accepts_attachments_for :recipe_images, attachment: :image

	with_options presence: true do
		validates :title
		validates :body
	end
end
