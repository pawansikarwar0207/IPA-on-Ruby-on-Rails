class AddQuestionIdToUserReactions < ActiveRecord::Migration[7.0]
  def change
    add_column :user_reactions, :question_id, :integer
  end
end
