class Comment < ApplicationRecord
    belongs_to :author
    belongs_to :commentable, polymorphic: true
end