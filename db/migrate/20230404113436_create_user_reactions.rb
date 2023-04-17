class CreateUserReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_reactions do |t|
      t.integer :reactable_id
      t.string :reactable_type

      t.timestamps
    end
  end
end
