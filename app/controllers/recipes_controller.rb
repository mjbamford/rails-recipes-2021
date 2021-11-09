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
                upload_file
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
                upload_file
                format.html { redirect_to @recipe }
            else
                format.html { render :edit }
            end
        end
    end

    def permitted_params
        params.required(:recipe).permit(
            :name, :difficulty, :author_id, ingredient_ids: [], comments_attributes: [ :author_id, :text ]
        ) 
    end

    def upload_file
        if uploaded_file = params[:recipe][:image]
            pathname = Rails.root.join 'public', 'images', uploaded_file.original_filename

            File.open(pathname, 'wb') do |file|
                file.write uploaded_file.read
            end

            @recipe.update_attribute :image_filename, uploaded_file.original_filename
        end
    end
end
