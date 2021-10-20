class Recipe < ApplicationRecord
    belongs_to :author
    has_many :materials, class_name: 'RecipeIngredient'
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
end
