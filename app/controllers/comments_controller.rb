class CommentsController < ApplicationController
	def create
		@recipe = Recipe.find(params[:recipe_id])
		@comment = @recipe.comments.build(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to @recipe
		else
			render 'recipes/show'
		end
	end

	def destroy
		# @article = Article.find(params[:article_id])
		@comment = Comment.find(params[:recipe_id])
		if @comment.destroy
			redirect_to recipe_path(@comment.recipe)
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:content, :user_id, :recipe_id)
	end
end
