class AddTypeToUserReaction < ActiveRecord::Migration[7.0]
  def change
    add_column :user_reactions, :reaction_type, :string
  end
end
