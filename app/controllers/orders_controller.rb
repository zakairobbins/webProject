class OrdersController < ApplicationController
  def create
    @order = Order.new
    @order.cart
  end

  def show
  end

  def update
    order = Order.find(params[:id])
    respond_to do |format|
      format.json{
        order.update_attributes(completed: true)
        p order.completed
        render json: order
      }
    end
  end

  def destroy
  end

  private

  def order_params
    params.require(:order).permit()
  end
end
