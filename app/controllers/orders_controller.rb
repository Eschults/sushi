class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      redirect_to order_path(@order)
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
