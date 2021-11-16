class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
    has_many :comments, as: :commentable
    has_many :logs, as: :loggable
end
