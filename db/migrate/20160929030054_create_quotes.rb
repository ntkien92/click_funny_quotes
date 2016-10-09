class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
      t.string :title
      t.string :description
      t.string :language
      t.integer :main_quote_id

      t.timestamps
    end
  end
end
