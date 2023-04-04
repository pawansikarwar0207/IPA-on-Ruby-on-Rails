class PlansController < ApplicationController
	before_action :authenticate_user!
	def index
		@plans = Plan.user_plans
	end

	def add_user_plan
		plan = Plan.find(params[:plan_id])
		end_date = plan.set_end_date
		
		if current_user.user_plans.present?
			current_user.user_plans.destroy_all
		end

		user_plan =  UserPlan.create(
			plan_id: params[:plan_id],
			user_id: current_user.id,
			start_date: Date.today,
			end_date: Date.today + end_date
			)
		redirect_to plans_path
	end


	
	
end

