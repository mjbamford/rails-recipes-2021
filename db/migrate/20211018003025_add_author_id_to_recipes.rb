class AddAuthorIdToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipes, :author, foreign_key: true
  end
end
