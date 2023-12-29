class UserPlansController < ApplicationController
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

    @user_plan = @plan.user_plans.create(
      customer_id: @stripe_customer.id,
      stripe_transaction_id: @charge.id,
      amount_paid: @amount_to_be_paid
    )
    redirect_to plan_path(@plan), notice: 'You have purchased plan successfully'
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
