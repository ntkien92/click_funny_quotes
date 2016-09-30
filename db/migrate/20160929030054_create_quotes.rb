class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
    	t.string :name
    	t.string :background
    	t.string :background2
    	t.string :description
    	t.string :algorithm
    	t.string :facebook_fields
      t.integer :category_id
      t.integer :layout_id
      t.string :language

      t.timestamps
    end
  end
end
