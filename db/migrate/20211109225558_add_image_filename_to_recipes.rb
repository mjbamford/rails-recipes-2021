class AddImageFilenameToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :image_filename, :string
  end
end
