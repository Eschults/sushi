class StripeCustomersController < ApplicationController
  def new
  end

  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )
    current_user.save_stripe_token(customer)
    redirect_to new_order_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to stripe_customers_path
  end
end
