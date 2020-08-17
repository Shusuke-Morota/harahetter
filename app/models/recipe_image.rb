class RecipeImage < ApplicationRecord
	belongs_to :recipe
	attachment :image

	validates :image, presence: true
end
