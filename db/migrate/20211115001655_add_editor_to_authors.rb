class AddEditorToAuthors < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :editor, :boolean, null: false, default: false
  end
end
