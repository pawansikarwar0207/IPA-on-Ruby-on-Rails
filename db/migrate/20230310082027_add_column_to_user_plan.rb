class AddColumnToUserPlan < ActiveRecord::Migration[7.0]
  def change
    add_column :user_plans, :start_date, :date
    add_column :user_plans, :end_date, :date
  end
end
