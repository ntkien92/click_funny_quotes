class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
    	t.string :alias
    	t.text :contents, array: true, default: []
    	t.integer :quote_id

      t.timestamps
    end
  end
end
