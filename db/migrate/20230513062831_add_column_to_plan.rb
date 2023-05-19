class AddColumnToPlan < ActiveRecord::Migration[7.0]
  def change
    add_column :plans, :stripe_transaction_id, :string
    add_reference :plans, :user
    add_reference :plans, :plan
  end
end
