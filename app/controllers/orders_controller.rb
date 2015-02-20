class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      if current_user.stripe_customer_token
        if Stripe::Customer.retrieve(current_user.stripe_customer_token).default_source != ""
          redirect_to order_path(@order)
        else
          redirect_to new_stripe_customer_path
        end
      else
        redirect_to new_stripe_customer_path
      end
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = current_user.orders
  end

  private

  def order_params
    params.require(:order).permit(:pickup_date, :delivery_date, :pickup_time, :delivery_time)
  end
end
