class AddColumnToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :answer, :text
  end
end
