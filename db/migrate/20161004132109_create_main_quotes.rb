class CreateMainQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :main_quotes do |t|
      t.string :name
      t.string :background_id
      t.string :background2_id
      t.string :algorithm
      t.string :facebook_fields
      t.integer :category_id
      t.integer :layout_id

    end
  end
end
