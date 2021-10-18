class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :difficulty
      t.references :author
      # t.bigint :author_id, :foreign_key: true, index: true
      t.timestamps
    end
  end
end
