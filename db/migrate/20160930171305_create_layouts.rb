class CreateLayouts < ActiveRecord::Migration[5.0]
  def change
    create_table :layouts do |t|
      t.string :name
      t.string :demo_url
      t.text :layer
    end
  end
end
