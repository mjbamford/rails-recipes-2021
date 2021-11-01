class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :author, null: false, foreign_key: true
      t.belongs_to :commentable, polymorphic: true, null: false, index: true
      t.string :text
      t.timestamps
    end
  end
end
