class PlansController < ApplicationController
	before_action :authenticate_user!
	def index
		@plans = Plan.user_plans
		@selected_plan = params[:selected_plan] # get selected plan parameter from URL
  	@plan = Plan.find_by(name: @selected_plan) if @selected_plan.present? # set @plan based on selected plan parameter
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

  def show
  	@plan = Plan.find(params[:id])
  	@user = current_user
  	@user_plans = @user.user_plans
  	@plan_ids = @user_plans.pluck(:plan_id)
  	render locals: { plan: @plan }
  end
	
end

