class AddIndexModel < ActiveRecord::Migration[5.0]
  def change
    add_index  :main_quotes, :name, :unique => true
    add_index  :categories, :name, :unique => true
    add_index :layouts, :name, :unique => true
    add_index :answers, [:alias, :quote_id], :unique => true

  end
end
