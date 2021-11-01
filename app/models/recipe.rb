class Recipe < ApplicationRecord
    belongs_to :author
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    has_many :comments, as: :commentable

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :difficulty, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

    accepts_nested_attributes_for :comments

    def to_s
        "Recipe #{id}; #{name}, #{difficulty}"
    end
end
