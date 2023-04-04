class UserPlan < ApplicationRecord

  belongs_to :user
  belongs_to :plan

  validates :start_date, :end_date, presence:true

  def remaining_days
    (end_date - Date.today).to_i  
  end




end
