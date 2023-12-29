class RemoveFieldFromPlans < ActiveRecord::Migration[7.0]
  def change
    remove_column :plans,:stripe_transaction_id, :string
    add_column :user_plans, :stripe_transaction_id, :string
  end
end
