class Recipe < ApplicationRecord
    belongs_to :author
    has_and_belongs_to_many :ingredients
end
