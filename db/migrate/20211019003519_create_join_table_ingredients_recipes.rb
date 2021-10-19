class CreateJoinTableIngredientsRecipes < ActiveRecord::Migration[6.1]
  def change
    create_join_table :recipes, :ingredients do |t|
      t.index [:ingredient_id, :recipe_id]
      t.index [:recipe_id, :ingredient_id]
    end
  end
end
