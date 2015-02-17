class StripeCustomersController < ApplicationController
  def new
  end

  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )
    current_user.stripe_customer_token = customer.id
    raise
    if current_user.save
      redirect_to orders_path
    else
      render :new
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Erreur Stripe : #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to stripe_customers_path
  end
end
