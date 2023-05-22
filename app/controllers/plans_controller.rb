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

	# Create the customer & purchase the plan with stripe.
	def create
		@stripe_service = StripeService.new
		@plan = Plan.find(params[:plan_id])
		@user = User.find_by(email: params[:email])
		unless @user.present?
			@user = User.create(user_params)
		end

		@stripe_customer = @stripe_service.find_or_create_customer(@user)
		@card = @stripe_service.create_stripe_customer_card(card_token_params, @stripe_customer)
		@amount_to_be_paid = params[:plan_price].to_i
		@charge = @stripe_service.create_stripe_charge(@amount_to_be_paid, @stripe_customer.id, @card.id, @plan)
		# @booking = workshop.booking.create(
		# 	customer_id: @customer.id,
		# 	stripe_transaction_id: @charge.id,
		# 	no_of_ticket: params[:no_of_tickets].to_i,
		# 	amount_paid: @amount_to_be_paid
		# 	)
		redirect_to plan_path(@plan), notice: 'Your have purchased plan successfully'
	rescue Stripe::StripeError => error
		redirect_to plan_path(@plan), alert: "#{error.message}"
	end

	private

	def user_params
		params.permit(:full_name, :email, :contact_number)
	end

	def card_token_params
		params.permit(:card_number, :exp_month, :exp_year, :cvv)
	end
	
end

