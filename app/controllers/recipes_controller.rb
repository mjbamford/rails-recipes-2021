class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
    end

    def show
        @recipe = Recipe.find params[:id]

        respond_to do |format|
            format.html
            format.text { render plain: @recipe }
            format.json { render json: @recipe }
        end
    end

    def create
        author = Author.find params[:recipe][:author_id]
        @recipe = author.recipes.build permitted_params
        # Or permit author_id in the mass assignment for the receipe.
        # @recipe = Recipe.new permitted_params

        respond_to do |format|
            if @recipe.save
                format.html { redirect_to @recipe }
            else
                format.html { render :new }
            end
        end
    end

    def permitted_params
        params.required(:recipe).permit(:name, :difficulty)
    end
end
