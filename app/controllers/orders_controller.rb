class OrdersController < ApplicationController
  def create
    @order = Order.new
    @order.cart
  end

  def show
  end

  def destroy
  end

  private

  def order_params
    params.require(:order).permit()
  end
end
