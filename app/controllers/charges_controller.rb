class ChargesController < ApplicationController
  def new
  end

  def create
    set_order
    # Amount in cents
    @amount = @order.price * 100

    customer_id = current_user.stripe_customer_token

    charge = Stripe::Charge.create(
      :customer    => customer_id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

end
