class StripePaymentsController < ApplicationController
  def new
  end

  def create
    @order = Order.find(params[:order_id])
    @order.price = params[:amount_cents]
    @user = @order.user
    customer = @user.stripe_customer

    charge = Stripe::Charge.create(
      :amount => @order.price.to_i, # amount in cents, again
      :currency => "eur",
      :customer => customer.id,
      :description => "#{@user.email} : order n°#{@order.id}"
    )
  rescue Stripe::CardError => e
  end
end
