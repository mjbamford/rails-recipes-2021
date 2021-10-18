class Author < ApplicationRecord
    # self
    has_many :recipes
end
