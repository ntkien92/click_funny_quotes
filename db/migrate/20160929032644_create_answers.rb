class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :alias
      t.text :contents, array: true, default: []
      t.integer :resource_id
      t.integer :quote_id

    end
  end
end
