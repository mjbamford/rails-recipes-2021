class RecipesController < ApplicationController
    include Unauthorized
    before_action :authenticate_user!
    rescue_from Pundit::NotAuthorizedError, with: :unauthorised

    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find params[:id]

        respond_to do |format|
            format.html
            format.text { render plain: @recipe }
            format.json { render json: @recipe }
        end
    end

    def new
        @recipe = Recipe.new
    end

    def create
        # author = Author.find params[:recipe][:author_id]
        # @recipe = author.recipes.build permitted_params
        # Or permit author_id in the mass assignment for the receipe.
        @recipe = Recipe.new permitted_params

        respond_to do |format|
            if @recipe.save
                format.html { redirect_to @recipe }
            else
                format.html { render :new }
            end
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
        authorize @recipe
    end

    def update
        @recipe = Recipe.find(params[:id])
        authorize @recipe

        respond_to do |format|
            if @recipe.update(permitted_params)
                format.html { redirect_to @recipe }
            else
                format.html { render :edit }
            end
        end
    end

    def permitted_params
        params.required(:recipe).permit(
            :name, :difficulty, :image, :author_id, ingredient_ids: [], comments_attributes: [ :author_id, :text ]
        ) 
    end
end
