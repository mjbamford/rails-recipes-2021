class CreateRecipeIngredients < ActiveRecord::Migration[6.1]
  class IngredientRecipe < ApplicationRecord
    self.table_name = 'ingredients_recipes'
  end

  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.string :quantity
      t.timestamps
    end

    # ActiveRecord::Base.transaction do
    #   IngredientRecipe.all.each do |join|
    #     RecipeIngredient.create! recipe_id: join.recipe_id, ingredient_id: join.ingredient_id
    #   end
    # end

    # drop_join_table :ingredients, :recipes
  end
end
