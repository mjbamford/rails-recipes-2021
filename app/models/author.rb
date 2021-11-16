class Author < ApplicationRecord
    belongs_to :user, optional: true
    has_many :recipes
    has_many :comments
    has_many :commented_recipes, 
        through: :comments, 
        source: :commentable, 
        source_type: 'Recipe',
        foreign_key: :commentable_type, 
        class_name: 'Recipe'
    has_many :logs, as: :loggable
end
