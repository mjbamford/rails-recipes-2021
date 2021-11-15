class Transaction < ApplicationRecord
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User'
  belongs_to :recipe
end
