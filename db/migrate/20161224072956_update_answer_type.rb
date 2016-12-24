class UpdateAnswerType < ActiveRecord::Migration[5.0]
  def change
    remove_column :answers, :contents
    add_column :answers, :contents, :jsonb, default: {}
  end
end
