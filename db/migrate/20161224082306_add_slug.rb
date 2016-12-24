class AddSlug < ActiveRecord::Migration[5.0]
  def change
    add_column :quotes, :slug, :string, unique: true
  end
end
