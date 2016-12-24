class AddColorInMainQuote < ActiveRecord::Migration[5.0]
  def change
    remove_column :main_quotes, :background_id
    remove_column :main_quotes, :background2_id
    add_column :main_quotes, :color, :string, :array => true, default: []
    add_column :main_quotes, :background_url, :integer, array: true, default: []
  end
end
