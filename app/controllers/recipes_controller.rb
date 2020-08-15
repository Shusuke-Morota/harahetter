class RecipesController < ApplicationController
  def index
  end

  def show
  	@recipe = Recipe.find(params[:id])
  end

  def edit
  end

  def create
  	@recipe = Recipe.new(recipe_params)
  	@recipe.user_id = current_user.id
  	@recipe.save
  	redirect_to recipe_path(@recipe)
  end

  def new
  	@recipe = Recipe.new
  end


  private
  def recipe_params
  	params.require(:recipe).permit(:title, :body)
  end
end
