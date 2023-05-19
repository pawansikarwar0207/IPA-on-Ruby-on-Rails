class RemoveFieldFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :stripe_user_id, :string
    add_column :users, :stripe_customer_id, :string
  end
end
