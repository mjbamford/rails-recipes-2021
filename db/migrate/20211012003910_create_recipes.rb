class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :difficulty
      # See 3025 migration
      # t.references :author, foreign_key: true, null: false
      t.timestamps
    end
  end
end
