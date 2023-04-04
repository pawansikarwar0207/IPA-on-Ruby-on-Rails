class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :keywords
      t.boolean :is_premium, default: false

      t.timestamps
    end
  end
end
