class Book < ApplicationRecord
    has_many :comments, as: :commentable
end
