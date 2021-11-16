class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.references :loggable, polymorphic: true, index: true
      t.text :body
      t.timestamps
    end
  end
end
