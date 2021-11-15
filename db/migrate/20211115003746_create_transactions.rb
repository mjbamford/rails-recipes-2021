class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.belongs_to :seller, null: false, foreign_key: { to_table: :users }
      t.belongs_to :buyer, null: false, foreign_key: { to_table: :users}
      t.belongs_to :recipe, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
